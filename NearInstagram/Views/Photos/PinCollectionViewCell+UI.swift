//
//  PinCollectionViewCell+UI.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension PinCollectionViewCell {
    func setupSubViews(){
        addPinImage()
        addConstraintsToImage()
    }
    
    func addPinImage() {
        pinImage = UIImageView(image: #imageLiteral(resourceName: "pinterest"))
        pinImage.contentMode = .scaleAspectFit
        addSubview(pinImage)
    }
    
    func addConstraintsToImage() {
        pinImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        pinImage.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        pinImage.autoMatch(.height, to: .height, of: self)
        pinImage.autoMatch(.width, to: .width, of: self)
    }
}
