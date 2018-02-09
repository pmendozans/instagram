//
//  PhotosTabBarController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class PhotosTabBarController: UITabBarController {
    
    let tags = ["iPhone", "iPad", "Mac"]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewControllers()
        setupStyle()
    }
    
    func loadViewControllers() {
        var tabNavigationControllers: [UINavigationController] = []
        for tag in tags {
            let tagViewController = TagPhotosViewController()
            tagViewController.tagName = tag
            tagViewController.tabBarItem = UITabBarItem(title: tag, image: UIImage(named: tag.lowercased()), tag: 0)
            let navigationController = UINavigationController(rootViewController: tagViewController)
            tabNavigationControllers.append(navigationController)
        }
        viewControllers = tabNavigationControllers
    }
}
