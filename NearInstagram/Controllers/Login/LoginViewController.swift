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
import PinterestSDK

class LoginViewController: UIViewController {
    
    var loginButton: WKWebView!
    
    private let instagramLoginManager = InstagramLoginManager()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginWithPinterest()
    }
    
    func loginWithPinterest() {
        print("LOLS")
        PDKClient.sharedInstance().authenticate(withPermissions: [""], from: self, withSuccess: {_ in
            
        }, andFailure: {_ in
            
        })
    }
    
    func navigateToPhotos() {
        let photosTabController = PhotosTabBarController()
        present(photosTabController, animated: true, completion: nil)
    }
}

