//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/6/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    var appsGroup: AppsGroup?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsGroup?.feed.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppRowCell
        cell.nameLabel.text = appsGroup?.feed.results[indexPath.item].name ?? ""
        cell.companyName.text = appsGroup?.feed.results[indexPath.item].artistName ?? ""
        if let url = appsGroup?.feed.results[indexPath.item].artworkUrl100{
            cell.imageView.sd_setImage(with:URL(string: url))
        }
        return cell
    }
    
    let topBottomSpacing: CGFloat = 12
    let lineSpacing: CGFloat = 10
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height:( view.frame.height - ( (2 * lineSpacing) + (2 * topBottomSpacing))) / 3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomSpacing, left: 0 , bottom: topBottomSpacing, right: 0)
    }
}

