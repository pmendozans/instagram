//
//  TagsManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class BoardViewModel {
    
    private let apiManager = ApiManager()
    private let boardDecoder = BoardDecoder()

    func getImages(byBoard board: String) -> Promise<[Pin]> {
        return Promise { fullfill, reject in
            apiManager.genericRequest(request: PinRouter.getPinsInBoard(boardName: board)).then { responseJson in
                self.boardDecoder.decodeMedia(jsonDictionary: responseJson)
            }.then{ photoList in
                fullfill(photoList)
            }.catch { error in
                reject(error)
            }
        }
    }
    
    func getPinDetails(byPinId pinId: String) -> Promise<Pin> {
        return Promise { fullfill, reject in
            apiManager.genericRequest(request: PinRouter.getPinDetails(pinId: pinId)).then { responseJson in
                self.boardDecoder.decodePinDetails(jsonDictionary: responseJson)
                }.then{ photoInformation in
                    fullfill(photoInformation)
                }.catch { error in
                    reject(error)
            }
        }
    }
}
