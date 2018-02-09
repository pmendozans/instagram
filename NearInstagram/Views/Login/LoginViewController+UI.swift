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
        styleLoginButton()
        addloginButtonConstraints()
        addTopLogo()
        styleTopLogo()
        addTopLogoConstraints()
        view.backgroundColor = UIColor.white
    }
    //MARK: Login Button
    func addLoginButton() {
        loginButton = UIButton()
        loginButton.setTitle(NSLocalizedString("login-with-pinterest", comment: ""), for: .normal)
        loginButton.addTarget(self, action: #selector(self.tapLoginButton(sender:)), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    func addloginButtonConstraints() {
        loginButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        loginButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        loginButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        loginButton.autoSetDimension(.height, toSize: 45)
    }
    
    func styleLoginButton() {
        loginButton.backgroundColor = Colors.pinterestRed
        loginButton.layer.cornerRadius = 5
    }
    
    //MARK: Top Logo Image
    func addTopLogo() {
        topLogoImage = UIImageView(image: #imageLiteral(resourceName: "pinterest"))
        view.addSubview(topLogoImage)
    }
    
    func addTopLogoConstraints() {
        topLogoImage.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        topLogoImage.autoPinEdge(.bottom, to: .top, of: loginButton, withOffset: 50)
        topLogoImage.autoAlignAxis(toSuperviewAxis: .vertical)
        topLogoImage.autoSetDimension(.width, toSize: 150)
    }
    
    func styleTopLogo() {
        topLogoImage.contentMode = .scaleAspectFit
    }
}
