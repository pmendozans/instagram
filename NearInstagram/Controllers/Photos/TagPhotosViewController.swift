//
//  TagPhotosViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import PromiseKit

class TagPhotosViewController: UIViewController {

    var tagName: String!
    var tableView: UITableView!
    var pinList: [Pin] = []
    var boardManager = BoardManager()
    let cellIdentifier = "PinTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupTableView()
        loadMediaFromAPI()
    }

    
    func loadMediaFromAPI() {
        boardManager.getImages(byBoard: "iphone").then { pinItems -> Void in
            self.pinList = pinItems
            self.tableView.reloadData()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(PinTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension TagPhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PinTableViewCell
        let pin = pinList[indexPath.row]
        cell.setupSubViews()
        return cell
    }
}

extension TagPhotosViewController: UITableViewDelegate {
    
}
