//
//  FireTest2.swift
//  Hack2019
//
//  Created by Andrew Benisek on 11/3/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import Firebase
import Promises

//create an empty array of songs
var eventqueue: [Song] = []

class FireTest2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQueue(id:0)
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
