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
    var pinImage: UIImageView!
    var boardManager = BoardManager()
    var pin: Pin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadPinInformation()
    }
    
    func loadPinInformation() {
        boardManager.getPinDetails(byPinId: pinId).then { pin -> Void in
            self.pin = pin
            self.showDataInViews()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    func showDataInViews(){
        if let imageUrl = pin.imageUrl {
            pinImage.kf.setImage(with: imageUrl)
        }
        
    }
    
}
