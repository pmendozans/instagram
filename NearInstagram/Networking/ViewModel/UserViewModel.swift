//
//  UserApiManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit

class UserApiManager {
    
    private enum Endpoints {
        static let getMyProfile = "/v1/me/"
    }
    
    private let apiManager = ApiManager()
    private let userDecoder = UserDecoder()
    private let parametersManager = ParametersManager()
    private let pinFieldsToRequest = ["bio", "counts", "created_at", "id", "first_name", "image", "last_name", "username"]
    
    func getUserInformation() -> Promise<User> {
        return Promise { fullfill, reject in
            parametersManager.getTokenAndFieldsParameters(fields: pinFieldsToRequest).then { params -> ApiRouter in
                return ApiRouter.get(Endpoints.getMyProfile, "", params)
                }.then { router in
                    self.apiManager.genericRequest(request: router)
                }.then { responseJson in
                    self.userDecoder.decodeUserInfo(jsonDictionary: responseJson)
                }.then{ userInfo -> Void in
                    fullfill(userInfo)
                }.catch { error in
                    reject(error)
            }
        }
    }
}
