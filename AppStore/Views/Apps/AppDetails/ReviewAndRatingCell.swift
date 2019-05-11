//
//  PreviewAndRatingCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class ReviewAndRatingCell: UICollectionViewCell {
    let reviewAndRatingLabel = UILabel(text: "Review & Ratings", font: .boldSystemFont(ofSize: 22))
    let horizontalReviewAndRatingControler = HorizontalPreviewAndRatingController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(reviewAndRatingLabel)
        reviewAndRatingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 10, left: 16, bottom: 0, right: 16))
        addSubview(horizontalReviewAndRatingControler.view)
        horizontalReviewAndRatingControler.view.anchor(top: reviewAndRatingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
