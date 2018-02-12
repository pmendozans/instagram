//
//  PhotoDetailsViewController.swift
//  NearInstagram
//
//  Created by Pablo Arturo Ruiz Mendoza on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDetailsViewController: UIViewController {
    var pinId: String = ""
    var pinImage = UIImageView()
    var createdLabel = UILabel()
    var followCount = UILabel()
    var noteLabel = UILabel()
    var likeButton = UIButton()
    var pin: Pin!
    
    private var boardViewModel = BoardViewModel()
    private var isLiked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadPinInformation()
    }
    
    private func showDataInViews(){
        if let imageUrl = pin.imageUrl {
            pinImage.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "pinterest"))
        }
    }
    
    private func loadPinInformation() {
        boardViewModel.getPinDetails(byPinId: pinId).then { pin -> Void in
            self.pin = pin
            self.showDataInViews()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    @objc func likeButtonDoubleTap() {
        var tintColor = Colors.pinterestRed
        if isLiked {
            tintColor = UIColor.black
        }
        isLiked = !isLiked
        likeButton.tintColor = tintColor
    }
}
