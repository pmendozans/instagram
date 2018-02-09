//
//  TagsManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class BoardManager {
    
    private enum Endpoints: String {
        case getPinsInBoard = "v1/boards/%@/pins/"
    }
    
    private let apiManager = ApiManager()
    private let boardDecoder = BoardDecoder()
    private let parametersManager = ParametersManager()
    
    func getImages(byBoard board: String) -> Promise<[Pin]> {
        let fieldsToRequest = ["note", "image", "created_at", "id"]
        return Promise { fullfill, reject in
            parametersManager.getPinParameters(fields: fieldsToRequest).then { params -> ApiRouter in
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
}
