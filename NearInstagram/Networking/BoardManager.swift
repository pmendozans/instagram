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
    
    func getImages(byBoard board: String) -> Promise<[Media]> {
        /*return Promise { fulfill, reject in
            guard let request = BoardRouter.get("iphone").urlRequest else {
                let error = NSError(domain: "ServerErrorIn200", code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "Server Error In 200"])
                return reject(error)
            }
            apiManager.genericRequest(request: request).then { json in
                self.boardDecoder.decodeMedia(jsonDictionary: json)
                }.then { mediaItems in
                    fulfill(mediaItems)
                }.catch { error in
                    print(error.localizedDescription)
                    return reject(error)
                }
        }*/
        let fieldsToRequest = ["note", "image", "created_at"]
        return Promise { fullfill, reject in
            parametersManager.getPinParameters(fields: fieldsToRequest).then { params in
                guard let request = BoardRouter.get("iphone").urlRequest else {
                    
                    return reject(error)
                }
            }
            
        }
    }
}
