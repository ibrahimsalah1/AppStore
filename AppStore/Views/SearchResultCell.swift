//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/5/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 64).isActive = true
        image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        image.backgroundColor = .red
        image.layer.cornerRadius = 12
        return image
    }()
    
    let appNameLabel : UILabel = {
        let name = UILabel()
        name.text = "APP NAME"
        return name
    }()
    
    let appCatLabel : UILabel = {
        let category = UILabel()
        category.text = "APP Category"
        return category
    }()
    
    let appRateLabel : UILabel = {
        let rate = UILabel()
        rate.text = "29.2M"
        return rate
    }()
    
    let getButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        return button
    }()

    lazy var screenshot1ImageView = createScreenshotImageView().self
    lazy var screenshot2ImageView = createScreenshotImageView().self
    lazy var screenshot3ImageView = createScreenshotImageView().self

        
    func createScreenshotImageView() -> UIImageView{
        let image = UIImageView()
        image.backgroundColor = .blue
        image.layer.cornerRadius = 8
        return image
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [appNameLabel, appCatLabel, appRateLabel]), getButton])
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overAllStackView = VerticalStackView(arrangedSubviews: [infoTopStackView, screenshotStackView], spacing: 16)
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
