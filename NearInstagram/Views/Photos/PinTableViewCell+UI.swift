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
        addConstraintsToDescription()
        setupCell()
    }
    
    func addPinImage() {
        pinImage = UIImageView(image: #imageLiteral(resourceName: "pinterest"))
        pinImage.contentMode = .scaleAspectFit
        addSubview(pinImage)
        
    }
    
    func addPinDescription() {
        pinDescription = UITextView()
        addSubview(pinDescription)
        pinDescription.isUserInteractionEnabled = false
    }
    
    func addConstraintsToImage() {
        pinImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
        pinImage.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        pinImage.autoSetDimension(.height, toSize: 80)
        pinImage.autoSetDimension(.width, toSize: 80)
    }
    
    func addConstraintsToDescription() {
        pinDescription.autoPinEdge(toSuperviewEdge: .trailing, withInset: 8)
        pinDescription.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        pinDescription.autoPinEdge(.leading, to: .trailing, of: pinImage, withOffset: 8)
        pinDescription.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        pinDescription.autoSetDimension(.height, toSize: 80)
    }
    
    func setupCell() {
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        selectionStyle = .none
    }
    
    func sizeHeightToContent() {
        pinDescription.translatesAutoresizingMaskIntoConstraints = true
        pinDescription.sizeToFit()
        pinDescription.isScrollEnabled = false
    }

}
