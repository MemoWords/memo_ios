//
//  TabBar.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    
    // MARK: - Properties
    var collectionsNavController: UINavigationController?
    var searchNavController: UINavigationController?
    var configNavController: UINavigationController?
    
    let collectionItem = UITabBarItem()
    let searchItem = UITabBarItem()
    let configItem = UITabBarItem()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this code is temporaly.
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let searchController = storyboard.instantiateViewController(identifier: "SearchViewController")
        
        self.collectionsNavController = UINavigationController(rootViewController: CollectionsViewController())
        self.searchNavController = UINavigationController(rootViewController: searchController)
        self.configNavController = UINavigationController(rootViewController: ConfigViewController())
        
        self.configItems()
        self.addItems()
        self.configTabBar()
    }
    
    // MARK: - Functions
    private func configItems() {
        collectionItem.title = TabBarItems.collections.title
        collectionItem.image = UIImage(systemName: "folder")
        searchItem.title = TabBarItems.search.title
        searchItem.image = UIImage(systemName: "magnifyingglass")
        configItem.title = TabBarItems.settings.title
        configItem.image = UIImage(named: "gear_selected")
    }
    
    private func addItems() {
        collectionsNavController?.tabBarItem = collectionItem
        searchNavController?.tabBarItem = searchItem
        configNavController?.tabBarItem = configItem
    }
    
    private func getControllers() -> [UINavigationController] {
        return [
            collectionsNavController!,
            searchNavController!,
            configNavController!
        ]
    }
    
    private func configTabBar() {
        self.overrideUserInterfaceStyle = .light
        self.tabBar.tintColor = .memoSecondBlue
        self.viewControllers = self.getControllers()
    }

}
