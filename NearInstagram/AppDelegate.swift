//
//  AppDelegate.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 1/31/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import PinterestSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let pinterestAppId = "4949323701479819048"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        PDKClient.configureSharedInstance(withAppId: pinterestAppId)
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

