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
        
        self.collectionsNavController = UINavigationController(rootViewController: CollectionsViewController())
        self.searchNavController = UINavigationController(rootViewController: SearchViewController())
        self.configNavController = UINavigationController(rootViewController: ConfigViewController())
        
        self.configItems()
        self.addItems()
        self.configTabBar()
    }
    
    // MARK: - Functions
    private func configItems() {
        collectionItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        collectionItem.title = nil
        collectionItem.image = UIImage(systemName: "folder.fill")
        searchItem.title = nil
        searchItem.image = UIImage(systemName: "magnifyingglass")
        configItem.title = nil
        configItem.image = UIImage(systemName: "gearshape.fill")
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
        self.tabBar.tintColor = .primaryColor
        self.tabBar.backgroundColor = .whiteColor
        self.tabBar.unselectedItemTintColor = .bodyColor
        self.tabBar.isTranslucent = false
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = true
        self.viewControllers = self.getControllers()
    }

}
