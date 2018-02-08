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
    let apiManager = ApiManager()
    let boardDecoder = BoardDecoder()
    let parametersManager = ParametersManager()
    
    func getImages(byBoard board: String) -> Promise<[Pin]> {
        let fieldsToRequest = ["note", "image", "created_at"]
        return Promise { fullfill, reject in
            parametersManager.getPinParameters(fields: fieldsToRequest).then { params -> BoardRouter in
                return BoardRouter.get("685532443217810716", params)
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
