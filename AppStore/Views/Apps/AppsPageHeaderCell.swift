//
//  AppsPageHeaderCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/7/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
import SDWebImage

class AppsPageHeaderCell : UICollectionViewCell{
    
    let companyLabel = UILabel(text: "AppName", font: .boldSystemFont(ofSize: 12))
    let appTitleLabel = UILabel(text: "this prety bio about the app here it is ", font: .systemFont(ofSize: 24))
    let image = UIImageView(cornerRadius: 8)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        companyLabel.textColor = .blue
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel, appTitleLabel, image], spacing: 10)
        appTitleLabel.numberOfLines = 0
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (socialApp : SocialApp) {
        companyLabel.text = socialApp.name
        appTitleLabel.text = socialApp.tagline
        image.sd_setImage(with: URL(string: socialApp.imageUrl))
    }
}
