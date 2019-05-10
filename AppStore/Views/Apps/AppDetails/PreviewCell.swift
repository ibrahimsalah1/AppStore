//
//  PreviewCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class  PreviewCell: UICollectionViewCell {
    
    let horizontalPreviewScreenshotsController = HorizontalPreviewScreenshotsController()
    let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 22))
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(previewLabel)
        previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(horizontalPreviewScreenshotsController.view)
        horizontalPreviewScreenshotsController.view.anchor(top: previewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
