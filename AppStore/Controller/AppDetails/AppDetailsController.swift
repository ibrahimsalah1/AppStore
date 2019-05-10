//
//  AppDetailsController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/9/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class AppDetailsController : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    let detailsCellId = "detailsCell"
    let previewCellId = "previewCell"
    var appDetails: Result?
    var appId: String!{
        didSet {
            Serivce.shared.fetchAppDetails(id: appId, completion: { (response, error) in
                if let error = error {
                    print("Can not fetch appdetails data ", error)
                }
                self.appDetails = response?.results.first
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: detailsCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if appDetails != nil {
            return 2
        } else {
            return 0
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailsCellId, for: indexPath) as! AppDetailsCell
            if let app = appDetails {
                cell.configure(app: app)
            }
            return cell
        }else {
            let previewCell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId , for: indexPath) as! PreviewCell
            previewCell.horizontalPreviewScreenshotsController.app = appDetails
            return previewCell
            
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            // calculated estimated height of cell
            let dummyCell = AppDetailsCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            if let app = appDetails {
                dummyCell.configure(app: app)
            }
            dummyCell.layoutIfNeeded()
            let estimatedHeight = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return .init(width: view.frame.width, height: estimatedHeight.height)
        } else {
            return .init(width: view.frame.width, height: 500)
        }
        
    }
    

}
