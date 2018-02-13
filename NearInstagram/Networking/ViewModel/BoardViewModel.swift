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
    
    private let pisService = PinService()
    private let boardDecoder = BoardDecoder()

    func getImages(byBoard board: String) -> Promise<[Pin]> {
        return pisService.getImages(byBoard: board)
                .then { responseJson in
                    return self.boardDecoder.decodeMedia(jsonDictionary: responseJson)
                }
    }
    
    func getPinDetails(byPinId pinId: String) -> Promise<Pin> {
        return pisService.getPinDetails(byPinId: pinId)
                .then { responseJson -> Promise<Pin> in
//                    if let objPin: Pin = self.boardDecoder.genericObjectDecoder(params: responseJson) {
//                        print(objPin)
//                    }
                    return self.boardDecoder.decodePinDetails(jsonDictionary: responseJson)
                }
    }
}
