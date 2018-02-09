//
//  PinCollectionViewCell.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class PinCollectionViewCell: UICollectionViewCell {
    var pinImage: UIImageView!
    
    func loadPinData(pin: Pin) {
        if let pinUrl = pin.imageUrl {
            pinImage.kf.setImage(with: pinUrl)
        }
    }
}
