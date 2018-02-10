//
//  TagsManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class BoardApiManager {
    
    private enum Endpoints: String {
        case getPinsInBoard = "v1/boards/%@/pins/"
        case getPinDetails = "/v1/pins/%@/"
    }
    
    private let apiManager = ApiManager()
    private let boardDecoder = BoardDecoder()
    private let parametersManager = ParametersManager()
    private let pinFieldsToRequest = ["note", "image", "created_at", "id"]
    
    func getImages(byBoard board: String) -> Promise<[Pin]> {
        return Promise { fullfill, reject in
            parametersManager.getTokenAndFieldsParameters(fields: pinFieldsToRequest).then { params -> ApiRouter in
                return ApiRouter.get(Endpoints.getPinsInBoard.rawValue, board, params)
            }.then { router in
                self.apiManager.genericRequest(request: router)
            }.then { responseJson in
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
            parametersManager.getTokenAndFieldsParameters(fields: pinFieldsToRequest).then { params -> ApiRouter in
                return ApiRouter.get(Endpoints.getPinDetails.rawValue, pinId, params)
            }.then { router in
                self.apiManager.genericRequest(request: router)
            }.then { responseJson in
                self.boardDecoder.decodePinDetails(jsonDictionary: responseJson)
            }.then{ photoList in
                fullfill(photoList)
            }.catch { error in
                reject(error)
            }
        }
    }
}
