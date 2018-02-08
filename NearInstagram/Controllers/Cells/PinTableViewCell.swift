//
//  PinTableViewCell.swift
//  NearInstagram
//
//  Created by Pablo Arturo Ruiz Mendoza on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class PinTableViewCell: UITableViewCell {
    
    var pinImage: UIImageView!
    var pinDescription: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubViews()
        print("LOLED")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    

}
