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
        
//        let favoritesVC = FavoritesViewController()
//        let favoritesNavController = UINavigationController(rootViewController: favoritesVC)
//        favoritesNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
//
//        viewControllers = [contactsNavController, circlesNavController, favoritesNavController]
        viewControllers = [songNavController, searchNavController]
    }

}
