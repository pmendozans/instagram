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
import Alamofire
import SwiftyJSON

class BoardDecoder {
    func decodeMedia(jsonDictionary: Parameters) -> Promise<[Pin]> {
        return Promise { fullfill, reject in
            let json = JSON(jsonDictionary)
            //TODO: Move getting the data to another layer
            guard let pinData = json["data"].array else {
                reject("" as! Error)
                return
            }
            guard let mediaItems = Mapper<Pin>().mapArray(JSONString: pinData.description) else {
                reject("" as! Error)
                return
            }
            fullfill(mediaItems)
        }
    }
    
    func decodePinDetails(jsonDictionary: Parameters) -> Promise<Pin> {
        return Promise { fullfill, reject in
            let json = JSON(jsonDictionary)
            guard let pin =  Pin(JSONString: json["data"].description) else {
                reject("" as! Error)
                return
            }
            fullfill(pin)
        }
    }
}
