//
//  PhotosTabBarController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class PhotosTabBarController: UITabBarController {
    
    private let tags = ["iPhone", "iPad", "Mac"]
    private let boards = ["685532443217810716", "685532443217817355", "685532443217817358"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewControllers()
        setupStyle()
    }
    
    func loadViewControllers() {
        var tabNavigationControllers: [UINavigationController] = []
        for (index, tag) in tags.enumerated() {
            let tagViewController = BoardListViewController()
            tagViewController.tagName = tag
            tagViewController.boardId = boards[index]
            tagViewController.tabBarItem = UITabBarItem(title: tag, image: UIImage(named: tag.lowercased()), tag: 0)
            let navigationController = UINavigationController(rootViewController: tagViewController)
            tabNavigationControllers.append(navigationController)
        }
        viewControllers = tabNavigationControllers
    }
}
