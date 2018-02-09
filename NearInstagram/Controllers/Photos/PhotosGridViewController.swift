//
//  PhotosGridViewController.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import Kingfisher

class PhotosGridViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var modalImage: UIImageView!
    var pinList: [Pin] = []
    var boardManager = BoardManager()
    let cellIdentifier = "PinTableViewCell"
    var indexToShowImage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupCollectionView()
        loadMediaFromAPI()
    }

    func loadMediaFromAPI() {
        boardManager.getImages(byBoard: "iphone").then { pinItems -> Void in
            self.pinList = pinItems
            self.collectionView.reloadData()
            }.catch { error in
                print(error.localizedDescription)
        }
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PinCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func addLongPressGesture(_ cell: UICollectionViewCell) {
        if self.traitCollection.forceTouchCapability == .available {
            //print("forceTouchCapability")
        } else {
            //print("NO forceTouchCapability")
        }
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressOnCell(sender:)))
        longPressGesture.minimumPressDuration = 2.0
        longPressGesture.allowableMovement = 5
        
        cell.addGestureRecognizer(longPressGesture)
    }
    
    @objc func longPressOnCell(sender: UILongPressGestureRecognizer) {
        //let touch = UITouch()
        //print(touch.force)
        if sender.state == .began {
            openImageModal()
        }
        else if sender.state == .ended {
            closeModalImage()
        }
        print(sender.state.rawValue)
    }
    
    func openImageModal() {
        let pinToOpen = pinList[indexToShowImage]
        modalImage = UIImageView()
        //TODO: GUARD
        //modalImage.kf.setImage(with: pinToOpen.imageUrl)
        modalImage.image = #imageLiteral(resourceName: "pinterest")
        view.addSubview(modalImage)
        modalImage.autoMatch(.height, to: .height, of: view)
        modalImage.autoMatch(.width, to: .width, of: view)
        modalImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        modalImage.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
    }
    
    func closeModalImage() {

        modalImage.isHidden = true
    }
}

extension PhotosGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pinList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PinCollectionViewCell
        let pin = pinList[indexPath.row]
        cell.setupSubViews()
        cell.loadPinData(pin: pin)
        addLongPressGesture(cell)
        return cell
    }
}

extension PhotosGridViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let cellSize = (collectionView.frame.size.width - padding) / 2
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexToShowImage = indexPath.row
    }
}
