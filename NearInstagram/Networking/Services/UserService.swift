//
//  UserService.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/12/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class UserService {
    
    let apiManager = ApiManager()
    
    func getUserInformation() -> Promise<[String: Any]> {
        return apiManager.genericRequest(request: UserRouter.getUserInformation())
    }
}
