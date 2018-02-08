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
    
    func setupSubviews() {
        addLoginButton()
        addloginButtonConstraints()
        styleLoginButton()
    }
    
    func addLoginButton() {
        loginButton = UIButton()
        loginButton.setTitle(NSLocalizedString("login-with-pinterest", comment: ""), for: .normal)
        loginButton.addTarget(self, action: #selector(self.tapLoginButton(sender:)), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    func addloginButtonConstraints() {
        loginButton.autoCenterInSuperview()
        loginButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        loginButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
    }
    
    func styleLoginButton() {
        loginButton.backgroundColor = UIColor.red
        loginButton.layer.cornerRadius = 5
    }
}
