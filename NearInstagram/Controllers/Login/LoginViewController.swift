//
//  LoginViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import WebKit
import SwiftyUserDefaults

class LoginViewController: UIViewController {
    
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    private let instagramLoginManager = InstagramLoginManager()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadUIViews()
        addConstraintsToViews()
        loadInstagramLogin()
        webView.navigationDelegate = self
    }
    
    func loadInstagramLogin() {
        guard let loginRequest = instagramLoginManager.getUrlRequest() else {
            return
        }
        webView.load(loginRequest)
    }
    
    func navigateToPhotos() {
        let photosTabController = PhotosTabBarController()
        present(photosTabController, animated: true, completion: nil)
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let requestUrlString = navigationAction.request.url?.absoluteString else {
            return
        }
        if(instagramLoginManager.isRedirectUrl(urlString: requestUrlString)) {
            let authToken = instagramLoginManager.getAuthenticationToken(urlString: requestUrlString)
            decisionHandler(.cancel)
            Defaults[.instagramToken] = authToken
            navigateToPhotos()
        }
        else{
            decisionHandler(.allow)
        }
    }
}
