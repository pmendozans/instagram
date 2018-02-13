//
//  UserApiManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class UserViewModel {
    
    private let userService = UserService()
    private let userDecoder = UserDecoder()
    
    func getUserInformation() -> Promise<User> {
        return userService.getUserInformation()
                .then { responseJson in
                    return self.userDecoder.decodeUserInfo(jsonDictionary: responseJson)
                }
    }
}
