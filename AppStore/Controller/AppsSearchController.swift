//
//  AppsSearchController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/5/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let cellId = "AppsSearchCell"
    fileprivate var serachResults = [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        fetchSearchResult()
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serachResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.configure(result: serachResults[indexPath.item])
        return cell
    }
}

extension AppsSearchController{
    func fetchSearchResult (){
        Serivce.shared.fetchApps { (results,error)  in
            if let error = error {
                print("can not fetch data", error)
            }
            self.serachResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
