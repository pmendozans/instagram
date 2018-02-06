//
//  TagPhotosViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class TagPhotosViewController: UIViewController {

    var tagName: String!
    var tableView: UITableView!
    var mediaItems: [Media] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIViews()
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension TagPhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
}

extension TagPhotosViewController: UITableViewDelegate {
    
}
