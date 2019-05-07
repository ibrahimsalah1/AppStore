//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/7/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import Foundation
import UIKit
class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorizontalControler = AppHeaderHorizontalControler()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(appHeaderHorizontalControler.view)
        appHeaderHorizontalControler.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
