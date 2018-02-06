//
//  TagsManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class TagsSerializer {
    let apiManager = ApiManager()
    let tagsDecoder = TagsDecoder()
    
    func getImages(byTag tag: String) -> Promise<[Media]> {
        return Promise { fulfill, reject in
            guard let request = TagsRouter.get("iphone").urlRequest else {
                let error = NSError(domain: "ServerErrorIn200", code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "Server Error In 200"])
                return reject(error)
            }
            apiManager.genericRequest(request: request).then { json in
                self.tagsDecoder.decodeMedia(jsonDictionary: json)
                }.then { mediaItems in
                    fulfill(mediaItems)
                }.catch { error in
                    print(error.localizedDescription)
                    return reject(error)
                }
        }
    }
}
