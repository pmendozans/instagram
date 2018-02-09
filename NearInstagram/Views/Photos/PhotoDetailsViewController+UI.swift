//
//  PhotoDetailsViewController+UI.swift
//  NearInstagram
//
//  Created by Pablo Arturo Ruiz Mendoza on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension PhotoDetailsViewController {
    func setupViews() {
        addPinImage()
        stylePinImage()
        addConstraintsToPinImage()
    }
    
    func addPinImage() {
        pinImage = UIImageView()
        view.addSubview(pinImage)
    }
    
    func stylePinImage() {
        pinImage.layer.cornerRadius = 5
        pinImage.clipsToBounds = true
        pinImage.backgroundColor = Colors.darkTransparent
    }
    
    func addConstraintsToPinImage() {
        pinImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        pinImage.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        pinImage.autoMatch(.height, to: .height, of: view)
        pinImage.autoMatch(.width, to: .width, of: view)
    }
}
