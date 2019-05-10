//
//  ScreenshotsCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class ScreenshotsCell: UICollectionViewCell {
    
    let screenshotImage = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        screenshotImage.backgroundColor = .lightGray
        addSubview(screenshotImage)
        screenshotImage.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
