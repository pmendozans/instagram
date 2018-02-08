//
//  LoginViewController+Constraints.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import WebKit
import PureLayout

extension LoginViewController {
    func addConstraintsToViews() {
        addloginButtonConstraints()
    }
    
    func addloginButtonConstraints(){
        loginButton.autoCenterInSuperview()
        loginButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        loginButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
    }
}
