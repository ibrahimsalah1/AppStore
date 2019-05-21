//
//  FooterCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/21/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class FooterCell: UICollectionReusableView {
    
    
    let activityController : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .gray)
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    
     let loadingLabel = UILabel(text: "LODING", font: .boldSystemFont(ofSize: 15))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadingLabel.constrainWidth(constant: 150)
        loadingLabel.textAlignment = .center
        let overAllStackView = VerticalStackView(arrangedSubviews: [activityController, loadingLabel], spacing: 10)
        addSubview(overAllStackView)
        overAllStackView.centerInSuperview()
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
