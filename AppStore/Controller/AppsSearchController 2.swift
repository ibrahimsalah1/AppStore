//
//  AppsSearchController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/5/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
