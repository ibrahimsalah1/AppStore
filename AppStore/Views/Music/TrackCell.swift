//
//  TrackCell.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/21/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit
class TrackCell : UICollectionViewCell {
    
    let trackImage = UIImageView(cornerRadius: 16)
    let trackName = UILabel(text: "Track Name", font: .boldSystemFont(ofSize: 18))
    let trackSubtitle = UILabel(text: "Here is track subtitle for this track", font: .systemFont(ofSize: 16), color: .lightGray, numberOfLines: 2)
    let listenButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        trackImage.constrainWidth(constant: 68)
        trackImage.constrainHeight(constant: 68)
        trackImage.image = #imageLiteral(resourceName: "todayIcon")
        
        listenButton.constrainHeight(constant: 30)
        listenButton.constrainWidth(constant: 80)
        listenButton.setTitle("LISTEN", for: .normal)
        listenButton.backgroundColor = .darkGray
        listenButton.setTitleColor(.white, for: .normal)
        listenButton.layer.cornerRadius = 16
        
        let overAllStackView = UIStackView(arrangedSubviews: [trackImage,
            VerticalStackView(arrangedSubviews: [trackName, trackSubtitle], spacing: 4),
            listenButton
                                                              ])
        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        overAllStackView.alignment = .center
        overAllStackView.spacing = 16
    }
    
    internal func configure(withTrack track : Result){
        trackImage.sd_setImage(with: URL(string: track.artworkUrl100 ?? ""))
        trackName.text = track.trackName
        trackSubtitle.text = track.collectionName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
