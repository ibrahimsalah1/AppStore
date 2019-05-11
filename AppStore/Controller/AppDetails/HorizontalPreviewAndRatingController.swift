//
//  HorizontalPreviewAndRatingController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class HorizontalPreviewAndRatingController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    var appReview: Review?{
        didSet{
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 0, right: 16)
        collectionView.register(RatingCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appReview?.feed.entry.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RatingCell
        let review = appReview?.feed.entry[indexPath.item]
        cell.title.text = review?.title.label
        cell.author.text = review?.author.name.label
        cell.content.text  = review?.content.label
        cell.appRateView.rating = Double(review?.rating.label ?? "0") ?? 0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: view.frame.height)
    }
}
