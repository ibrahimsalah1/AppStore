//
//  AppsCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/6/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class AppsCell: UICollectionViewCell {
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 22))
    let appsHorizontalController = AppsHorizontalController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(appsHorizontalController.view)
        appsHorizontalController.view.backgroundColor = .white
        appsHorizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
