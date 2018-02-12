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
    
    private let apiManager = ApiManager()
    private let userDecoder = UserDecoder()
    
    func getUserInformation() -> Promise<User> {
        return Promise { fullfill, reject in
            apiManager.genericRequest(request: UserRouter.getUserInformation()).then { responseJson in
                self.userDecoder.decodeUserInfo(jsonDictionary: responseJson)
            }.then{ userInformation in
                fullfill(userInformation)
            }.catch { error in
                reject(error)
            }
        }
    }
}
