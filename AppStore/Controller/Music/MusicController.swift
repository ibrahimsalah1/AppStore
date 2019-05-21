//
//  MusicController.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/21/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class MusicController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let trackCellId = "trackCellId"
    let footerCellId = "FooterCellId"
    var tracks = [Result]()
    
    let serachTerm = "Justin"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: trackCellId)
        collectionView.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId)
        
        fetchData(searchTerm: serachTerm, offset: 0, limit: 20)
    }
    
    fileprivate func fetchData(searchTerm: String, offset: Int, limit: Int){
        Serivce.shared.fetchTracks(serachTerm: searchTerm, offset: offset, limit: limit) { (tracks, error) in
            if let error = error {
                print("Can not fetch data ", error)
                return
            }
            self.tracks = tracks?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }
    var isPaginating = false
    var isDoneisPaginating = false
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trackCellId, for: indexPath) as! TrackCell
        let track = tracks[indexPath.item]
        cell.configure(withTrack: track)
        if indexPath.item == tracks.count - 1 , !isPaginating {
            print("last element")
            isPaginating = true
            Serivce.shared.fetchTracks(serachTerm: serachTerm , offset: tracks.count, limit: 20) { (tracks, error) in
                if let error = error {
                    print("Can not fetch data ", error)
                    return
                }
                if tracks?.results.count == 0 {
                    print("no more results")
                    self.isDoneisPaginating = true
                }
                self.tracks += tracks?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPaginating = false
                
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerCellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heigt: CGFloat = isDoneisPaginating ? 0 : 100
        return .init(width: view.frame.width, height: heigt)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 80)
    }
}
