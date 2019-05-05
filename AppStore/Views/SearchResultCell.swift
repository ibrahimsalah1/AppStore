//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/5/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
