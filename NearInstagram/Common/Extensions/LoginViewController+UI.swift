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
    func loadUIViews() {
        addWebView()
        addActivityIndicator()
    }
    
    func addWebView() {
        webView = WKWebView()
        view.addSubview(webView)
    }
    
    func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
}
