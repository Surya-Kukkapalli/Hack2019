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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(SongTableViewCell.self, forCellReuseIdentifier: cellId)
        setupNavigationBarItems();
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
        //addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem  = UIBarButtonItem(customView: addButton)
        
        // Setting up edit button
        //let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showEditing))
        //self.navigationItem.leftBarButtonItem = editButton
    }
}