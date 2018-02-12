//
//  UserRouter.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/12/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Alamofire
import SwiftyUserDefaults

enum UserRouter: URLRequestConvertible {
    
    case getUserInformation()
    
    var method: HTTPMethod {
        switch self {
        case .getUserInformation:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getUserInformation:
            return "/v1/me/"
        }
    }
    
    var params: [String: Any] {
        switch self {
        case .getUserInformation:
            return [
                "access_token": Defaults[.apiToken],
                "fields": "bio,counts,created_at,id,first_name,image,last_name,username"
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try ApiManager.baseUrlString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getUserInformation:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}

