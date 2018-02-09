//
//  UserDecoder.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

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

class UserDecoder {
    private let decoderError = CustomError(message: "Decoder Error").createCustomError()
    
    func decodeUserInfo(jsonDictionary: Parameters) -> Promise<User> {
        return Promise { fullfill, reject in
            let json = JSON(jsonDictionary)
            guard let user =  User(JSONString: json["data"].description) else {
                reject(decoderError)
                return
            }
            fullfill(user)
        }
    }
}
