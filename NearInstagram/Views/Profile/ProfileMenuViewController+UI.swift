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
        setBarTitle()
    }
    
    func setBarTitle() {
        //navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = Colors.pinterestRed
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = "PROFILE"
    }
    
    func addNavigationCloseButton() {
        let profileBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close-button"), style: .plain, target: self, action: #selector(self.closeProfile(sender:)))
        profileBarButton.tintColor = Colors.pinterestRed
        navigationItem.setRightBarButton(profileBarButton, animated: false)
    }
}
