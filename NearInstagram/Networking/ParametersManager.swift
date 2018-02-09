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
    func getTokenAndFieldsParameters(fields: [String]) -> Promise<[String: Any]>{
        return Promise { fullfill, _ in
            print(Defaults[.apiToken])
            var fieldsString = ""
            for (index, field) in fields.enumerated() {
                let trailingComma = (index == fields.count - 1) ? "" : ","
                fieldsString += "\(field)\(trailingComma)"
            }
            let params = [
                "access_token": Defaults[.apiToken],
                "fields": fieldsString,
            ]
            fullfill(params)
        }
    }
    
    
}
