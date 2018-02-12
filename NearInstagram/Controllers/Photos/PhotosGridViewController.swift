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
    var imageForModal: UIImage!
    var boardId: String!
    
    private let cellIdentifier = "PinTableViewCell"
    private var boardViewModel = BoardViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupCollectionView()
        loadMediaFromAPI()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PinCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    private func loadMediaFromAPI() {
        boardViewModel.getImages(byBoard: boardId).then { pinItems -> Void in
            self.pinList = pinItems
            self.collectionView.reloadData()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    private func addGestures(_ cell: PinCollectionViewCell) {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressOnCell(sender:)))
        longPressGesture.allowableMovement = 5
        var pressDuration = 0.5
        if self.traitCollection.forceTouchCapability == .available {
            pressDuration = 0.1
        }
        longPressGesture.minimumPressDuration = pressDuration
        cell.addGestureRecognizer(longPressGesture)
    }
    
    @objc func longPressOnCell(sender: UILongPressGestureRecognizer) {
        let pointTouched = sender.location(in: collectionView)
        let forceTouch = UITouch()
        let didForceTouch = forceTouch.force >= forceTouch.maximumPossibleForce
        let indexPath = collectionView.indexPathForItem(at: pointTouched)?.row
        if sender.state == .began && didForceTouch{
            openImageModal(pinIndex: indexPath!)
        }
        else if sender.state == .ended {
            closeModalImage()
        }
    }
    
    func getIndexFromActiveCell(_ sender: PinCollectionViewCell) {
        imageForModal = sender.pinImage.image
    }
    
    func openImageModal(pinIndex: Int) {
        if let imageUrl = pinList[pinIndex].imageUrl {
            modalImage.kf.setImage(with: imageUrl)
        }
        modalImage.isHidden = false
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
        addGestures(cell)
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
        let pinSelected = pinList[indexPath.row]
        let detailsViewController = PhotoDetailsViewController()
        detailsViewController.pinId = pinSelected.id
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
