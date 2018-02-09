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
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = "PROFILE"
    }
    
    func addNavigationCloseButton() {
        let profileBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close-button"), style: .plain, target: self, action: #selector(self.closeProfile(sender:)))
        profileBarButton.tintColor = UIColor.white
        navigationItem.setRightBarButton(profileBarButton, animated: false)
    }
}
