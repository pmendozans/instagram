//
//  ProfileMenuViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileMenuViewController: UIViewController {
    let logoutButton = UIButton()
    let profileImage = UIImageView()
    let usernameLabel = UILabel()
    
    private let pinterestManager = PinterestManager()
    private let navigationManager = NavigationManager()
    private let userViewModel = UserViewModel()
    private let errorAlert = ErrorAlerts.serverError
    private var userInformation: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadUserInformation()
    }
    
    func renderInformationToView() {
        if let profileUrl = userInformation.profilePictureUrl {
            profileImage.kf.setImage(with: profileUrl)
        }
    }
    
    func loadUserInformation() {
        userViewModel.getUserInformation().then { userInformation -> Void in
            print(userInformation)
            self.userInformation = userInformation
            self.renderInformationToView()
        }.catch { error in
            self.errorAlert.show()
        }
    }
    
    @objc func tapLogoutButton() {
        pinterestManager.logout()
        navigationManager.goToLogin()
    }
    
    @objc func closeProfile(sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
