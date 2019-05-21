//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/5/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 64).isActive = true
        image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        image.layer.cornerRadius = 14
        image.layer.borderWidth = 0.3
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.clipsToBounds = true
        return image
    }()
    
    let appNameLabel : UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return name
    }()
    
    let appCatLabel : UILabel = {
        let category = UILabel()
        category.font = UIFont.systemFont(ofSize: 12)
        category.textColor = .lightGray
        return category
    }()
    
    let appRateView : CosmosView = {
        let cosmosView = CosmosView()
        cosmosView.settings.starSize = 12
        cosmosView.settings.textColor = .lightGray
        cosmosView.settings.updateOnTouch = false
        cosmosView.settings.fillMode = .half
        cosmosView.settings.starMargin = 0
        cosmosView.settings.filledColor = UIColor.gray
        
        // Set the border color of an empty star
        cosmosView.settings.emptyBorderColor = UIColor.gray
        
        // Set the border color of a filled star
        cosmosView.settings.filledBorderColor = UIColor.gray
        return cosmosView
    }()
    
    let getButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
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
        //image.backgroundColor = .blue
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.layer.borderWidth = 0.3
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.contentMode = .scaleToFill
        return image
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [appNameLabel, appCatLabel, appRateView],spacing: 4), getButton])
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

    func configure(result: Result){
        appNameLabel.text = result.trackName
        appCatLabel.text = result.primaryGenreName
        appRateView.rating = Double(result.averageUserRating ?? 0.0)
        if (result.userRatingCount ?? 0) > 1000 {
            appRateView.text = "\((result.userRatingCount ?? 0) / 1000)k"
        } else {
            appRateView.text = "\((result.userRatingCount ?? 0))"
        }
        if let iconImageUrl = URL(string: result.artworkUrl100 ?? ""){
            appIconImageView.sd_setImage(with: iconImageUrl , completed: nil)
        }
        if result.screenshotUrls!.count > 0 {
            if let screen1 = URL(string: result.screenshotUrls![0]){
                screenshot1ImageView.sd_setImage(with: screen1 , completed: nil)
            }
        }
     
        if result.screenshotUrls!.count > 1{
            if let screen2 = URL(string: result.screenshotUrls![1]){
                screenshot2ImageView.sd_setImage(with: screen2 , completed: nil)
            }
        }
        
        if result.screenshotUrls!.count > 2 {
            if let screen3 = URL(string: result.screenshotUrls![2]){
                screenshot3ImageView.sd_setImage(with: screen3 , completed: nil)
            }
        }
        
    }
}
