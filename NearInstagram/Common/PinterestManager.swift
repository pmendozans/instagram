//
//  PinterestManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/7/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit
import PinterestSDK
import SwiftyUserDefaults

class PinterestManager {
    
    func login(viewController: UIViewController) -> Promise<Any> {

        return Promise { fullfill, reject in
            PDKClient.sharedInstance().authenticate(withPermissions: [PDKClientReadPublicPermissions, PDKClientReadRelationshipsPermissions, PDKClientWriteRelationshipsPermissions, PDKClientWritePublicPermissions], from: viewController, withSuccess: { user in
                guard let token = PDKClient.sharedInstance().oauthToken else {
                    return
                }
                Defaults[.apiToken] = token
                fullfill(token)
            }, andFailure: { error in
                reject(error!)
            })
        }
    }
}
