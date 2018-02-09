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
        setupCell()
        addPinImage()
        stylePinImage()
        addPinDescription()
        addConstraintsToImage()
        addConstraintsToDescription()
    }
    
    func addPinImage() {
        pinImage = UIImageView()
        addSubview(pinImage)
    }
    
    func stylePinImage() {
        pinImage.clipsToBounds = true
        pinImage.layer.cornerRadius = 5
        pinImage.contentMode = .scaleAspectFill
    }
    
    func addPinDescription() {
        pinDescription = UITextView()
        addSubview(pinDescription)
        pinDescription.isUserInteractionEnabled = false
    }
    
    func addConstraintsToImage() {
        pinImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
        pinImage.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
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
