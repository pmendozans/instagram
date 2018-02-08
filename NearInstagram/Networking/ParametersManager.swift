//
//  BoardParameters.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/7/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyUserDefaults

class ParametersManager {
    func getPinParameters(fields: [String]) -> Promise<[String: Any]>{
        return Promise { fullfill, _ in
            var fieldsString = ""
            for field in fields {
                fieldsString += "\(field) "
            }
            let params = [
                "access_token": Defaults[.apiToken],
                "fields": fieldsString,
            ]
            fullfill(params)
        }
    }
}
