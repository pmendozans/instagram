//
//  PinTableViewCell.swift
//  NearInstagram
//
//  Created by Pablo Arturo Ruiz Mendoza on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import Kingfisher

class PinTableViewCell: UITableViewCell {
    
    var pinImage: UIImageView!
    var pinDescription: UITextView!
    
    func loadPinData(pin: Pin) {
        if let pinUrl = pin.imageUrl {
            pinImage.kf.setImage(with: pinUrl)
        }
        pinDescription.text = pin.note
    }
}
