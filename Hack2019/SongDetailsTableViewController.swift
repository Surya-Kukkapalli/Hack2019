//
//  SongTableViewController.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit

class SongDetailsTableViewController: UITableViewController {
    
        
        
        /* declare view to display album cover and name */
        public let coverAndName: UIImageView = {
                let pic = UIImageView()
                pic.layer.cornerRadius = 10
                pic.layer.masksToBounds = true
                pic.translatesAutoresizingMaskIntoConstraints = false
                return pic
            }()
            
        /* declare cell for votes */
        public let votesLabel: UILabel = {
                let label = UILabel()
                label.isEnabled = true
                label.textColor = .label
                label.font = .systemFont(ofSize: 19)
                label.textAlignment = .left
                label.translatesAutoresizingMaskIntoConstraints = false
                label.superview?.bringSubviewToFront(label)
                return label
        }()
            
        /* declare cell for popularity */
            public let popularityLabel: UILabel = {
                let label = UILabel()
                label.isEnabled = true
                label.textColor = .secondaryLabel
                label.font = .systemFont(ofSize: 13)
                label.textAlignment = .left
                label.translatesAutoresizingMaskIntoConstraints = false
                label.superview?.bringSubviewToFront(label)
                return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(coverAndName)
        view.addSubview(votesLabel)
        view.addSubview(popularityLabel)
        self.tableView.register(SongTableViewCell.self, forCellReuseIdentifier: cellId)
        configureContraints()
    }
    
    let cellId = "SongTableViewCell"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let myCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? SongTableViewCell else {
            fatalError("The dequeued cell is not an instance of \(cellId)")
        }
        
        myCell.songNameLabel.text = "hello"
        myCell.artistLabel.text = "Surya Kukkapalli"
        myCell.albumPic.image = UIImage(named: "fake_album_cover")
        
        return myCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
        
        private func configureContraints() { /*
            let distAwayFromLeft: CGFloat = 90
            coverAndName.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            coverAndName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: distAwayFromLeft).isActive = true
    //        nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3).isActive = true
    //        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            coverAndName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            coverAndName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            
            votesLabel.topAnchor.constraint(equalTo: self.coverAndName.bottomAnchor, constant: -40).isActive = true
            votesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: distAwayFromLeft).isActive = true
    //        descriptionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
    //        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            votesLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            votesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            popularityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            popularityLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
    //        profilePic.rightAnchor.constraint(equalTo: self.nameLabel.leftAnchor, constant: -15).isActive = true
    //        profilePic.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
            popularityLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -17).isActive = true
            popularityLabel.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -17).isActive = true
        */ }

}

// MARK: Navigation
extension SongDetailsTableViewController {
    private func setupNavigationBarItems(){
        navigationItem.largeTitleDisplayMode = .never
    }
}
