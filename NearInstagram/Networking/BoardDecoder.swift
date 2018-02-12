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
    private let decoderError = CustomError(message: "Decoder Error").createCustomError()
    func decodeMedia(jsonDictionary: Parameters) -> Promise<[Pin]> {
        return Promise { fullfill, reject in
            let json = JSON(jsonDictionary)
            guard let pinData = json["data"].array else {
                reject(decoderError)
                return
            }
            guard let mediaItems = Mapper<Pin>().mapArray(JSONString: pinData.description) else {
                reject(decoderError)
                return
            }
            fullfill(mediaItems)
        }
    }
    
    func decodePinDetails(jsonDictionary: Parameters) -> Promise<Pin> {
        return Promise { fullfill, reject in
            let json = JSON(jsonDictionary)
            guard let pin =  Pin(JSONString: json["data"].description) else {
                reject(decoderError)
                return
            }
            fullfill(pin)
        }
    }
}
