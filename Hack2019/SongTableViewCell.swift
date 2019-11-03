//
//  SongTableViewCell.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    public let albumPic: UIImageView = {
            let pic = UIImageView()
            pic.layer.cornerRadius = 10
            pic.layer.masksToBounds = true
            pic.translatesAutoresizingMaskIntoConstraints = false
            return pic
        }()
        
        public let songNameLabel: UILabel = {
            let label = UILabel()
            label.isEnabled = true
            label.textColor = .label
            label.font = .systemFont(ofSize: 19)
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            label.superview?.bringSubviewToFront(label)
            return label
        }()
        
        public let artistLabel: UILabel = {
            let label = UILabel()
            label.isEnabled = true
            label.textColor = .secondaryLabel
            label.font = .systemFont(ofSize: 13)
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            label.superview?.bringSubviewToFront(label)
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addSubview(songNameLabel)
            addSubview(artistLabel)
            addSubview(albumPic)
            
            
            configureContraints()
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configureContraints() {
            let distAwayFromLeft: CGFloat = 90
            songNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            songNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: distAwayFromLeft).isActive = true
    //        nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3).isActive = true
    //        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            songNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            songNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            
            artistLabel.topAnchor.constraint(equalTo: self.songNameLabel.bottomAnchor, constant: -40).isActive = true
            artistLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: distAwayFromLeft).isActive = true
    //        descriptionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
    //        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            artistLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            artistLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            albumPic.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            albumPic.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
    //        profilePic.rightAnchor.constraint(equalTo: self.nameLabel.leftAnchor, constant: -15).isActive = true
    //        profilePic.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
            albumPic.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -17).isActive = true
            albumPic.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -17).isActive = true
        }

}

extension UIColor {
    static func adaptiveTextColor() -> UIColor {
        if #available(iOS 13, *) {
            return UIColor.init { (trait) -> UIColor in
                // the color can be from your own color config struct as well.
                return trait.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
            }
        }
        else { return UIColor.white }
    }
}
