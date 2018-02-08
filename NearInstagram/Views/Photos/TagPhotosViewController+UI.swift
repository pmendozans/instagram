//
//  TagPhotosViewController+UI.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

extension TagPhotosViewController {
    
    func setupSubviews() {
        addTable()
        addConstraintsToTable()
    }
    
    func addTable() {
        tableView = UITableView()
        view.addSubview(tableView)
    }
    
    func addConstraintsToTable() {
        tableView.autoMatch(.height, to: .height, of: view)
        tableView.autoMatch(.width, to: .width, of: view)
        tableView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
    }
}
