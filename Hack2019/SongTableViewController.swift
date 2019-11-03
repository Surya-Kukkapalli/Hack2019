//
//  SongTableViewController.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    let cellId = "SongTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(SongTableViewCell.self, forCellReuseIdentifier: cellId)
        setupNavigationBarItems();
        refreshControl = UIRefreshControl()
        configureRefreshControl();
    }
    
    @objc func addButtonPressed() {
        let searchTableVC = SearchTableViewController(nibName: nil, bundle: nil)
        searchTableVC.hideTabBar = true
        navigationController?.pushViewController(searchTableVC, animated: true)
    }
        
    @objc func showEditing(_ sender: UIBarButtonItem) {
            if self.tableView.isEditing {
                self.tableView.isEditing = false
                self.navigationItem.leftBarButtonItem?.title = "Edit"
            } else {
                self.tableView.isEditing = true
                self.navigationItem.leftBarButtonItem?.title = "Done"
            }
    //        self.tableView.reloadData()
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
        
        myCell.songNameLabel.text = "The Best Song Ever"
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         
         let confirmDelete = UIAlertController()
         confirmDelete.title = "Are you sure you want to delete this song from the queue?"
         confirmDelete.message = "This cannot be undone."
         
//        let voteAction = UIContextualAction(style: .normal, title: "Vote") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
//             // TODO: do something when they vote
//
//             actionPerformed(true)
//         }
         
         let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: @escaping (Bool) -> Void) in
             
             // configuring actions inside here so actionPerformed can be evaluated upon alert selection
             let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { action in
                 actionPerformed(true)
             })
             let noAction = UIAlertAction(title: "No", style: .cancel, handler: { action in
                 actionPerformed(false)
             })
             confirmDelete.addAction(yesAction)
             confirmDelete.addAction(noAction)
             self.present(confirmDelete, animated: true)
         }
         
//         return UISwipeActionsConfiguration(actions: [voteAction,deleteAction])
         return UISwipeActionsConfiguration(actions: [deleteAction])

     }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let songDetailsTableVC = SongDetailsTableViewController(nibName: nil, bundle: nil)
        // TODO: once we have array of songs, replace this with specific song name using indexPath
        songDetailsTableVC.navigationItem.title = "Surya Kukkapalli"
        navigationController?.pushViewController(songDetailsTableVC, animated: true)
    }
    
}

// MARK: Navigation
extension SongTableViewController {
    private func setupNavigationBarItems(){
        navigationItem.title = "Song Queue"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Setting up add button
        let addButton = UIButton(type: .contactAdd)
        addButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        addButton.contentMode = .scaleAspectFit
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem  = UIBarButtonItem(customView: addButton)
        
        // Setting up edit button
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showEditing))
        self.navigationItem.leftBarButtonItem = editButton
    }
}
// MARK: Refresh control
extension SongTableViewController {
    
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

