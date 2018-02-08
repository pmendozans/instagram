//
//  LoginViewController+UI.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit
import WebKit

extension LoginViewController {
    
    func addSubviews() {
        addLoginButton()
    }
    
    func addLoginButton() {
        loginButton = UIButton()
        loginButton.setTitle(NSLocalizedString("login-with-pinterest", comment: ""), for: .normal)
        loginButton.addTarget(self, action: #selector(self.tapLoginButton(sender:)), for: .touchUpInside)
        view.addSubview(loginButton)
    }
}
