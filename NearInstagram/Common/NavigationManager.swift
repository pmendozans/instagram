//
//  NavigationManager.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

class NavigationManager {
    func goToLogin() {
        let loginController = LoginViewController()
        UIApplication.shared.keyWindow?.rootViewController = loginController
    }
}
