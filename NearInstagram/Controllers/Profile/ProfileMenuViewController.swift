//
//  ProfileMenuViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class ProfileMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @objc func closeProfile(sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
