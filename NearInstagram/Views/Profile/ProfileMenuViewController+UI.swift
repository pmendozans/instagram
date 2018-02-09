//
//  ProfileMenuViewController+UI.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension ProfileMenuViewController {
    func setupViews() {
        addNavigationCloseButton()
        navigationController?.navigationBar.topItem?.title = "PROFILE"
        loadSubviews()
        constraintAndStyleLogoutButton()
        constraintAndStyleProfileImage()
    }
    
    func loadSubviews() {
        view.addSubview(logoutButton)
        view.addSubview(profileImage)
        view.addSubview(usernameLabel)
    }
    
    func constraintAndStyleLogoutButton() {
        logoutButton.setTitle(NSLocalizedString("logout", comment: "").uppercased(), for: .normal)
        logoutButton.backgroundColor = Colors.pinterestRed
        logoutButton.layer.cornerRadius = 5
        logoutButton.addTarget(self, action: #selector(tapLogoutButton), for: .touchUpInside)
        logoutButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        logoutButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        logoutButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        logoutButton.autoSetDimension(.height, toSize: 45)
    }
    
    func constraintAndStyleProfileImage() {
        profileImage.layer.cornerRadius = 5
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFit
        profileImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        profileImage.autoPinEdge(toSuperviewMargin: .top, relation: .equal)
        profileImage.autoMatch(.height, to: .height, of: view, withMultiplier: 0.20)
        profileImage.autoMatch(.width, to: .width, of: view)
    }
    
    func addNavigationCloseButton() {
        let profileBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close-button"), style: .plain, target: self, action: #selector(self.closeProfile(sender:)))
        profileBarButton.tintColor = Colors.pinterestRed
        navigationItem.setRightBarButton(profileBarButton, animated: false)
    }
}
