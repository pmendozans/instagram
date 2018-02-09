//
//  PhotosGridViewController+UI.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/8/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension PhotosGridViewController {
    func setupSubViews() {
        addCollectionView()
        addConstraintsToCollectionView()
        addModalImage()
        addConstraintsToModalImage()
        setNavTitle()
    }
    
    func setNavTitle(){
        navigationItem.title = NSLocalizedString("photos", comment: "").uppercased()
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
        }
    }
    
    func addCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.lightGray
        view.addSubview(collectionView)
    }
    
    func addConstraintsToCollectionView() {
        collectionView.autoMatch(.height, to: .height, of: view)
        collectionView.autoMatch(.width, to: .width, of: view)
        collectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
    }
    
    func addModalImage() {
        modalImage = UIImageView()
        modalImage.contentMode = .scaleAspectFit
        modalImage.backgroundColor = Colors.darkTransparent
        modalImage.isHidden = true
        view.addSubview(modalImage)
    }
    
    func addConstraintsToModalImage() {
        modalImage.autoMatch(.height, to: .height, of: view)
        modalImage.autoMatch(.width, to: .width, of: view)
        modalImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        modalImage.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
    }
}
