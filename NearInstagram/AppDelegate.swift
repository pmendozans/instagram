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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return PDKClient.sharedInstance().handleCallbackURL(url)
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return PDKClient.sharedInstance().handleCallbackURL(url)
    }
    
    func loadMainView() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let loginController = LoginViewController()
        self.window?.rootViewController = loginController
        self.window?.makeKeyAndVisible()
    }
}

