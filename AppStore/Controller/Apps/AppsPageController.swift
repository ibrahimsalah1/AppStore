//
//  AppsController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/6/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerReuseIdentifier = "HeaderCell"

class AppsPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let activityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.startAnimating()
        activity.hidesWhenStopped = true
        activity.color = .gray
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        // headerview
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        fetchAppsGroups()
    }
    var socialApps = [SocialApp]()
    var groups = [AppsGroup]()
    fileprivate func fetchAppsGroups(){
        
        var gamesGroup : AppsGroup?
        var topFreeAppsGroup: AppsGroup?
        var topGrossingGroup: AppsGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Serivce.shared.fetchSocialApps { (socialApps, error) in
            dispatchGroup.leave()
            if let error = error {
                print("Unable to fetch soical apps: ",error)
            }
            self.socialApps = socialApps ?? []
        }
        
        dispatchGroup.enter()
        Serivce.shared.fetchGames { (appsGroup, error) in
            dispatchGroup.leave()
            if let error = error{
                print("Failed to fetch games: ", error)
            }
            gamesGroup = appsGroup
            
        }
        
        
        dispatchGroup.enter()
        Serivce.shared.fetchTopFreeApps { (appsGroup, error) in
            dispatchGroup.leave()
            if let error = error{
                print("Failed to fetch games: ", error)
            }
            topFreeAppsGroup = appsGroup
        }
        
        
        dispatchGroup.enter()
        Serivce.shared.fetchTopGrossing { (appsGroup, error) in
            dispatchGroup.leave()
            if let error = error{
                print("Failed to fetch games: ", error)
            }
            topGrossingGroup = appsGroup
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
            if let gamesGroup = gamesGroup{
                self.groups.append(gamesGroup)
            }
            
            if let topFreeAppsGroup = topFreeAppsGroup{
                self.groups.append(topFreeAppsGroup)
            }
            
            if let topGrossingGroup =  topGrossingGroup{
                self.groups.append(topGrossingGroup)
            }
            
            self.collectionView.reloadData()

        }
    }
    
    // header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! AppsPageHeader
        headerCell.appHeaderHorizontalControler.socialApps = self.socialApps
        headerCell.appHeaderHorizontalControler.collectionView.reloadData()
        return headerCell
    }
    
    
    // height of header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height:300)
    }
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsCell
        
        cell.titleLabel.text = groups[indexPath.item].feed.title
        cell.appsHorizontalController.appsGroup = groups[indexPath.row]
        cell.appsHorizontalController.itemTappedHandler = { [weak self] (feedResult) in
            let detailsController = AppDetailsController()
            detailsController.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(detailsController, animated: true)
        }
        cell.appsHorizontalController.collectionView.reloadData()
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
}
