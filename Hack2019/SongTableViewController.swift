//
//  SongTableViewController.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import Firebase

class SongTableViewController: UITableViewController {
    
    let cellId = "SongTableViewCell"
    
    var eventqueue: [Song] = []

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
    
    //Makes a call to the database to pull the queue with the given ID
     //Passes the DocumentReference object to  buildPlaylist
     func getQueue(id: Int) {
         let db = Firestore.firestore()
         let eventQueue = db.collection("queues").document("\(id)")
         let document = eventQueue.getDocument {(document,err) in
             if let document = document, document.exists {
                 self.buildPlaylist(document:document)
             } else {
                 print("Document does not exist")
             }
         }
     }

     func buildPlaylist(document: DocumentSnapshot){
         //init an array of Songs
         var queue: [Song] = []
         //Playlist is a NSDictionary
         let playlist = document.data()
         //Get the list of songs in the playlist
         let list: NSDictionary? = (playlist?["songs"] as! NSDictionary)
         //Make sure the list is not nil
         if let list = list {
             for element in list {
                 var song = getSong(element:element.value as! NSDictionary)
                 queue.append(song)
             }
         }
         eventqueue = queue
         // MARK: - This is where the call to the draw the table needs to be - directly call eventqueue
    
     }

     //Takes the element of the queue of songs and creates a song struck
     func getSong(element: NSDictionary) -> Song{
         //init song object
         var song = Song(id:"",track:"",artist:"",votes:0,popularity:"",album_cover:"")
         song.id = (element["id"] as! String)
         song.track = (element["track"] as! String)
         song.artist = (element["artist"] as! String)
         song.popularity = (element["popularity"] as! String)
         song.votes = (element["votes"] as! Int)
         song.album_cover = (element["album_cover"] as! String)
         return song
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

