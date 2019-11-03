//
//  CurrentSongViewController.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit

class CurrentSongViewController: UIViewController {
    
    @objc func moreButtonPressed() {
            let searchTableVC = SearchTableViewController()
            navigationController?.pushViewController(searchTableVC, animated: true)
        }
    
    // declare view for album cover
    public let albumCover: UIImageView = {
        
        let albumImageView = UIImageView()
            albumImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        albumImageView.image = UIImage(named: "beyonce")
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        return albumImageView
    }()
    
    // declare view for song title
    public let songLabel: UILabel = {
        let label = UILabel(frame: CGRect(x:0,y: 0,width: 250,height: 50))
        label.text = "Single Ladies"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.bringSubviewToFront(label)
        return label
    }()
    
    // declare view for artist
    public let artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Astha Rastogi"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.bringSubviewToFront(label)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBarItems();
        view.addSubview(albumCover)
        view.addSubview(songLabel)
        view.addSubview(artistLabel)
        
        self.title = "Currently Playing"
        view.backgroundColor = .white

        configureContraints()
    }
    
    private func configureContraints() {

        albumCover.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        albumCover.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 85).isActive = true
        albumCover.widthAnchor.constraint(equalTo: albumCover.widthAnchor).isActive = true
        albumCover.heightAnchor.constraint(equalTo: albumCover.heightAnchor).isActive = true
        
        songLabel.topAnchor.constraint(equalTo: albumCover.bottomAnchor, constant: 50).isActive = true
        songLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        songLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        songLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 30).isActive = true
        artistLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        artistLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
 }

// MARK: Navigation
extension CurrentSongViewController {
    private func setupNavigationBarItems(){
        navigationItem.title = "Currently Playing"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Setting up add button
        let moreButton = UIButton(type: .infoLight)
        moreButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        moreButton.contentMode = .scaleAspectFit
        moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem  = UIBarButtonItem(customView: moreButton)
    }
}
