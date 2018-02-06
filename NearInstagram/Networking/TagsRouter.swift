//
//  TagsRouter.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import Alamofire

enum TagsRouter {
    static let apiUrlString = "tags/%@/media/recent"
    case get(String)
}

extension TagsRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .get:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .get:
                return nil
            }
        }()
        
        let url: URL = {
            let ralativePath: String?
            switch self {
            case .get(let tag):
                ralativePath = String(format: TagsRouter.apiUrlString, tag)
            }
            var url = URL(string: ApiManager.baseUrl)!
            if let relativePath = ralativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}
