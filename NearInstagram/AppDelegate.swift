//
//  AppDelegate.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        loadMainView()
        return true
    }
    
    func loadMainView() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.black
        let loginController = LoginViewController()
        self.window?.rootViewController = loginController
        self.window?.makeKeyAndVisible()
    }
}

