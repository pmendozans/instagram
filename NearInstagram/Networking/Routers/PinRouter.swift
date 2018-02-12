//
//  TagsRouter.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Alamofire
import SwiftyUserDefaults

enum PinRouter: URLRequestConvertible {
    
    case getPinsInBoard(boardName: String)
    case getPinDetails(pinId: String)
    
    var method: HTTPMethod {
        switch self {
        case .getPinsInBoard,
             .getPinDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPinsInBoard(let boardName):
            return "v1/boards/\(boardName)/pins/"
        case .getPinDetails(let pinId):
            return "/v1/pins/\(pinId)/"
        }
    }
    
    var params: [String: Any] {
        switch self {
        case .getPinsInBoard,
             .getPinDetails:
            return [
                "access_token": Defaults[.apiToken],
                "fields": "note,image,created_at,id"
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try ApiManager.baseUrlString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getPinsInBoard,
             .getPinDetails:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}
