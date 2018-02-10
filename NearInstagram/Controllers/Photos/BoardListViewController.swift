//
//  TagPhotosViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/6/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import PromiseKit

class BoardListViewController: UIViewController {
    
    private var pinList: [Pin] = []
    private var boardApiManager = BoardApiManager()
    private let cellIdentifier = "PinTableViewCell"
    private let errorAlert = ErrorAlerts.serverError
    
    var tableView: UITableView!
    var tagName: String!
    var boardId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupTableView()
        loadMediaFromAPI()
    }
    
    func loadMediaFromAPI() {
        boardApiManager.getImages(byBoard: boardId).then { pinItems -> Void in
            self.pinList = pinItems
            self.tableView.reloadData()
        }.catch { error in
            self.errorAlert.show()
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PinTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    @objc func navigateToProfile(sender: Any) {
        let profileViewController = ProfileMenuViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        present(profileNavigationController, animated: true, completion: nil)
    }
}

extension BoardListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PinTableViewCell
        let pin = pinList[indexPath.row]
        cell.setupSubViews()
        cell.loadPinData(pin: pin)
        return cell
    }
}

extension BoardListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gridViewController = PhotosGridViewController()
        gridViewController.boardId = boardId
        navigationController?.pushViewController(gridViewController, animated: true)
    }
}
