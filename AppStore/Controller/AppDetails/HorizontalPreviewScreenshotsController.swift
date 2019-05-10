//
//  HorizontalPreviewScreenshotsController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class HorizontalPreviewScreenshotsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    let cellId = "scrrenshotsId"
    var app:Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top:0 , left: 16, bottom: 0, right: 16)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotsCell
        cell.screenshotImage.sd_setImage(with: URL(string: app?.screenshotUrls[indexPath.row] ?? "")) 
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
