//
//  AppRowCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/7/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    let imageView = UIImageView(cornerRadius: 13)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 16))
    let companyName =  UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .lightGray
        imageView.layer.borderWidth = 0.3
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 16
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        let overAllStackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews: [nameLabel,companyName], spacing: 5), getButton])
        overAllStackView.alignment = .center
        overAllStackView.spacing = 5
        addSubview(overAllStackView)
        overAllStackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
