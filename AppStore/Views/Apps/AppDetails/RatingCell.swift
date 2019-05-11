//
//  RatingCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
import Cosmos
class RatingCell: UICollectionViewCell {
    let ratingView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 248/255, alpha: 1)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let title = UILabel(text: "title", font: .boldSystemFont(ofSize: 12))
    let author = UILabel(text: "Author", font: .boldSystemFont(ofSize: 12),color: UIColor(white: 0.5, alpha: 0.5))
    let appRateView : CosmosView = {
        let cosmosView = CosmosView()
        cosmosView.settings.starSize = 18
       // cosmosView.settings.textColor = .lightGray
        cosmosView.settings.updateOnTouch = false
        cosmosView.settings.fillMode = .half
        cosmosView.settings.starMargin = 0
        cosmosView.settings.filledColor = UIColor.orange
       // Set the border color of an empty star
        cosmosView.settings.emptyBorderColor = UIColor.orange
       // Set the border color of a filled star
       cosmosView.settings.filledBorderColor = UIColor.orange
        return cosmosView
    }()
    let content = UILabel(text: "conten content\n conten content\n conten content\n", font: .systemFont(ofSize: 10, weight: .semibold), numberOfLines: 0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .purple
        title.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        author.textAlignment = .right
        addSubview(ratingView)
        ratingView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        
        let headerStack = UIStackView(arrangedSubviews: [title, author])
        let overAllStack = VerticalStackView(arrangedSubviews: [headerStack,appRateView,content,UIView()], spacing: 10)
        ratingView.addSubview(overAllStack)
        overAllStack.fillSuperview(padding: .init(top: 20, left: 16, bottom: 20, right: 16))
//        overAllStack.distribution = .fill
//        overAllStack.alignment = .top
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
