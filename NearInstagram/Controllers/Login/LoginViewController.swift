//
//  LoginViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    private let instagramLoginManager = InstagramLoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadInstagramLogin()
    }
    
    func loadInstagramLogin(){
        guard let loginRequest = instagramLoginManager.getUrlRequest() else {
            return
        }
        webView.load(loginRequest)
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
        }
        else{
            decisionHandler(.allow)
        }
    }
}
