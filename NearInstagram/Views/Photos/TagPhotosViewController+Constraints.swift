//
//  TagPhotosViewController+Constraints.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PureLayout

extension TagPhotosViewController {
    func addConstraintsToViews() {
        tableView.autoMatch(.height, to: .height, of: view)
        tableView.autoMatch(.width, to: .width, of: view)
    }
}
