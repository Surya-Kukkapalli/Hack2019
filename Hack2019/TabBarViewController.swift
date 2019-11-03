//
//  TabBarViewController.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup custom view controllers
        let songVC = SongTableViewController()
        let songNavController = UINavigationController(rootViewController: songVC)
        songNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let searchVC = SearchTableViewController()
        let searchNavController = UINavigationController(rootViewController: searchVC)
        searchNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let currentSongVC = CurrentSongViewController()
        let currentSongNavController = UINavigationController(rootViewController: currentSongVC)
        currentSongNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 2)
        
        let historyVC = HistoryViewController()
        let historyNavController = UINavigationController(rootViewController: historyVC)
        historyNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        
        viewControllers = [songNavController, searchNavController, currentSongNavController, historyNavController]
    }

}
