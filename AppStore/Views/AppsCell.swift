//
//  AppsCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/6/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class AppsCell: UICollectionViewCell {
    let sectionLabel : UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
        
    }()
    let horizontalCollection = AppsHorizontalController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sectionLabel)
        sectionLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(horizontalCollection.view)
        horizontalCollection.view.backgroundColor = .white
        horizontalCollection.view.anchor(top: sectionLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
