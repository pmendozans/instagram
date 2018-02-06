//
//  TagsDecoder.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit
import ObjectMapper

class TagsDecoder {
    func decodeMedia(jsonDictionary: [String: Any]) -> Promise<[Media]> {
        let mediaItems = Mapper<Media>().mapArray(JSONArray: [jsonDictionary])
        return Promise { fullfill, reject in
            fullfill(mediaItems)
        }
    }
}
