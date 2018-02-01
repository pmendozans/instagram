//
//  InstagramLoginManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

struct InstagramLoginManager {
    
    let authUrlString = "https://api.instagram.com/oauth/authorize/"
    let clientSecret = "b5ce64fca1784e479c553aecc920203f"
    let clientId = "e6a300d34f914ff29d6be049710ed277"
    let redirectUrl = "http://www.nearsoft.com"
    let accessTokenKey = "access_token="
    let scope = "follower_list+public_content"
    
    func getUrlRequest() -> URLRequest? {
        let loginUrlString = "\(authUrlString)?client_id=\(clientId)&redirect_uri=\(redirectUrl)&response_type=token&scope=\(scope)&DEBUG=True"
        guard let loginUrl = URL(string: loginUrlString) else {
            return nil
        }
        let loginRequest = URLRequest(url: loginUrl)
        return loginRequest
    }
    
    func isRedirectUrl(urlString: String) -> Bool {
        return urlString.hasPrefix(redirectUrl)
    }
    
    func getAuthenticationToken(urlString: String) -> String {
        let upperRange = urlString.range(of: accessTokenKey)?.upperBound
        let tokenString = urlString.suffix(from: upperRange!)
        return String(tokenString)
    }
}
