//
//  AppHeaderHorizontalControler.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/7/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit


private let collectionHeaderCellId = "collectionHeaderCellId"
class AppHeaderHorizontalControler: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsPageHeaderCell.self, forCellWithReuseIdentifier: collectionHeaderCellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionHeaderCellId, for: indexPath)

        return collectionHeaderCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 46, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16)
    }
}
