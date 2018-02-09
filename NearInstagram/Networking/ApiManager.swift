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

    func genericRequest(request: URLRequestConvertible) -> Promise<[String: Any]>{
        return Promise { fullfill, reject in
            Alamofire.request(request).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let error = NSError(domain: "ServerErrorIn200", code: 0,
                                        userInfo: [NSLocalizedDescriptionKey: "Server Error In 200"])
                    guard let statusCode = response.response?.statusCode else {
                        reject(error)
                        return
                    }
                    switch statusCode {
                    case 200:
                        guard let rawJson = value as? [String: Any] else {
                            reject(error)
                            return
                        }
                        fullfill(rawJson)
                    default:
                        reject(error)
                    }
                case .failure(let error):
                    reject(error)
                }
            }
        }
    }
}
