//
//  SongTableViewController.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    let cellId = "SongTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(SongTableViewCell.self, forCellReuseIdentifier: cellId)
        refreshControl = UIRefreshControl()
        configureRefreshControl();
        self.title = "Played Songs"
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
        
        myCell.songNameLabel.text = "Past Song Played"
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


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

}

// MARK: Refresh control
extension HistoryViewController {
    
    func configureRefreshControl () {
        // Add the refresh control to your UIScrollView object.
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(handleRefreshControl),for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
//        self.tableView.reloadData()
        print("hello, world")
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
    
}
