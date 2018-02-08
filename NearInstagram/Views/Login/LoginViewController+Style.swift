//
//  LoginViewController+Style.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/7/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    func styleViews() {
        styleLoginButton()
    }
    
    func styleLoginButton() {
        loginButton.backgroundColor = UIColor.red
        loginButton.layer.cornerRadius = 5
    }
}
