//
//  PinTableViewCell+UI.swift
//  NearInstagram
//
//  Created by Pablo Arturo Ruiz Mendoza on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension PinTableViewCell {
    func setupSubViews(){
        addPinImage()
        addPinDescription()
        addConstraintsToImage()
    }
    
    func addPinImage() {
        pinImage = UIImageView(image: #imageLiteral(resourceName: "pinterest"))
        addSubview(pinImage)
        
    }
    
    func addPinDescription() {
        pinDescription = UITextView()
        addSubview(pinDescription)
    }
    
    func addConstraintsToImage() {
        pinImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
        pinImage.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        pinImage.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        pinImage.autoSetDimension(.height, toSize: 80)
        pinImage.autoSetDimension(.width, toSize: 80)
    }
    
    func addConstraintsToDescription() {
        
    }

}
