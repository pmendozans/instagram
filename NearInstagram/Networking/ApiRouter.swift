//
//  TagsRouter.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyUserDefaults
import PromiseKit

enum ApiRouter {
    case get(String, String, [String: Any])
}

extension ApiRouter: URLRequestConvertible {
    static let baseURLString: String = "https://api.pinterest.com"
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .get:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .get(_, _, let params):
                return params
            }
        }()
        
        let url: URL = {
            let ralativePath: String?
            switch self {
            case .get(let endpoint, let board, _):
                ralativePath = String(format: endpoint, board)
            }
            var url = URL(string: ApiRouter.baseURLString)!
            if let relativePath = ralativePath {
                url = url.appendingPathComponent(ralativePath!)
            }
            return url
        }()
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: params)
    }
}
