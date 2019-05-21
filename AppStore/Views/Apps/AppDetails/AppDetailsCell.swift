//
//  AppDetailsswift
//  AppStore
//
//  Created by Ibrahim Salah on 5/9/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import UIKit

class AppDetailsCell : UICollectionViewCell{
    let appImageIcon = UIImageView(cornerRadius: 16)
    let appNameLabel = UILabel(text: "AppName test tes dsfsd ffsdsfs sdfsd ", font: .boldSystemFont(ofSize: 16),numberOfLines : 2)
    let getBuuton = UIButton(title: "GET")
    let whatsNewLabel = UILabel(text: "What’s New", font: .boldSystemFont(ofSize: 14))
    let releaseNotesLabel = UILabel(text: "Bug fixes, stability improvements, repairs to time-space continuum, etc. etc.", font: .systemFont(ofSize: 12),numberOfLines : 0)
    let versionLabel = UILabel(text: "Version", font: .systemFont(ofSize: 12),numberOfLines : 0)
    
    let lineView : UIView = {
        let line = UIView()
        line.constrainHeight(constant: 0.5)
        line.backgroundColor = .lightGray
        return line
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        versionLabel.textColor = .lightGray
        appImageIcon.constrainWidth(constant: 140)
        appImageIcon.constrainHeight(constant: 140)
        appImageIcon.backgroundColor = .lightGray
        appImageIcon.layer.borderWidth = 0.3
        appImageIcon.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        
        getBuuton.constrainWidth(constant: 80)
        getBuuton.constrainHeight(constant: 32)
        getBuuton.layer.cornerRadius = 16
        getBuuton.backgroundColor = UIColor(red: 54/255, green: 138/255, blue: 242/255, alpha: 1)
        getBuuton.setTitleColor(.white, for: .normal)
        let topStackView = UIStackView(arrangedSubviews: [appImageIcon, VerticalStackView(arrangedSubviews: [appNameLabel,UIStackView(arrangedSubviews: [getBuuton,UIView()]),UIView()],spacing: 10)])
        topStackView.spacing = 10
        let overAllStackView = VerticalStackView(arrangedSubviews: [topStackView, whatsNewLabel,versionLabel, releaseNotesLabel, lineView] , spacing:10)
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 0 , left: 20, bottom: 0, right: 20))
    }
    
    func configure(app: Result){
        appImageIcon.sd_setImage(with: URL(string: app.artworkUrl512 ?? "" , relativeTo: nil))
        appNameLabel.text = app.trackName
        versionLabel.text = "Version \(app.version ?? "")"
        releaseNotesLabel.text = app.releaseNotes
        if app.price != 0 {
            getBuuton.setTitle("\(Double(app.price ?? 0.0))$", for: .normal)
        } else {
            getBuuton.setTitle("GET", for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
