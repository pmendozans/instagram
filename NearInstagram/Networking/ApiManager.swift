//
//  ApiManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

struct ApiManager {
    
    static let baseUrlString = "https://api.pinterest.com"

    func genericRequest(request: URLRequestConvertible) -> Promise<[String: Any]>{
        let requestError = CustomError(message: "Request Error").createCustomError()
        return Promise { fullfill, reject in
            Alamofire.request(request).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let statusCode = response.response?.statusCode else {
                        reject(requestError)
                        return
                    }
                    switch statusCode {
                    case 200:
                        guard let rawJson = value as? [String: Any] else {
                            reject(requestError)
                            return
                        }
                        fullfill(rawJson)
                    default:
                        reject(requestError)
                    }
                case .failure(let error):
                    reject(error)
                }
            }
        }
    }
}
