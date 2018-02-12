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
        loadSubviews()
        constraintsAndStylePinImage()
        constraintsAndStyleLikeButton()
        addGesturesToViews()
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func loadSubviews() {
        view.addSubview(pinImage)
        view.addSubview(createdLabel)
        view.addSubview(followCount)
        view.addSubview(noteLabel)
        view.addSubview(likeButton)
    }
    
    private func constraintsAndStylePinImage() {
        pinImage.layer.cornerRadius = 5
        pinImage.clipsToBounds = true
        pinImage.contentMode = .scaleAspectFit
        pinImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        pinImage.autoPinEdge(toSuperviewMargin: .top, relation: .equal)
        pinImage.autoMatch(.height, to: .height, of: view, withMultiplier: 0.25)
        pinImage.autoMatch(.width, to: .width, of: view)
    }
    
    private func constraintsAndStyleLikeButton() {
        likeButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        likeButton.tintColor = UIColor.black
        likeButton.autoPinEdge(.top, to: .bottom, of: pinImage, withOffset: 10)
        likeButton.autoPinEdge(.leading, to: .leading, of: view, withOffset: 10)
        likeButton.autoSetDimension(.height, toSize: 35)
        likeButton.autoSetDimension(.width, toSize: 35)
    }
    
    private func addGesturesToViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeButtonDoubleTap))
        tap.numberOfTapsRequired = 2
        likeButton.addGestureRecognizer(tap)
    }
}
