//
//  LoginViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import PromiseKit

class LoginViewController: UIViewController {
    
    var loginButton: UIButton!
    let pinterestManager = PinterestManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    @objc func tapLoginButton(sender: Any) {
        pinterestManager.login(viewController: self).then { token in
            self.navigateToPhotos()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    func navigateToPhotos() {
        let photosTabController = PhotosTabBarController()
        present(photosTabController, animated: true, completion: nil)
    }
}

