//
//  AppDetailsController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/9/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class AppDetailsController : UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .purple
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
