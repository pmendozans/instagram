//
//  TagPhotosViewController+UI.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

extension BoardListViewController {
    
    func setupSubviews() {
        view.backgroundColor = UIColor.white
        loadSubvies()
        addConstraintsToTable()
        addConstraintsToActivityIndicator()
        addProfileButton()
    }
    
    private func loadSubvies() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    private func addConstraintsToTable() {
        tableView.autoMatch(.height, to: .height, of: view)
        tableView.autoMatch(.width, to: .width, of: view)
        tableView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        tableView.isHidden = true
    }
    
    private func addConstraintsToActivityIndicator() {
        activityIndicator.autoCenterInSuperview()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.color = Colors.pinterestRed
    }
    
    private func addProfileButton() {
        let profileBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "user-icon"), style: .plain, target: self, action: #selector(self.navigateToProfile(sender:)))
        profileBarButton.tintColor = Colors.pinterestRed
        navigationItem.setRightBarButton(profileBarButton, animated: false)
    }
}
