//
//  ScreenshotsCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class ScreenshotsCell: UICollectionViewCell {
    
    let screenshotImage = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        screenshotImage.backgroundColor = .lightGray
        screenshotImage.contentMode = .scaleAspectFill
        screenshotImage.layer.borderWidth = 0.3
        screenshotImage.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        addSubview(screenshotImage)
        screenshotImage.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
