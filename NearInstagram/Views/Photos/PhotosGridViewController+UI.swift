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
}
