//
//  TabBar.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    var collectionsNavController: UINavigationController?
    var searchNavController: UINavigationController?
    var settingsNavController: UINavigationController?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
		let collectionsPresenter = CollectionsPresenter()
		collectionsNavController = UINavigationController(rootViewController: CollectionsViewController(with: collectionsPresenter))
        searchNavController = UINavigationController(rootViewController: SearchViewController())
        settingsNavController = UINavigationController(rootViewController: SettingsViewController())
        configItems()
        configTabBar()
    }

    // MARK: - Functions
    private func configItems() {
        // Collections
        collectionsNavController?.tabBarItem.image = .FOLDER_UNSELECTED
        collectionsNavController?.tabBarItem.selectedImage = .FOLDER_SELCTED
        collectionsNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
        // Search
        searchNavController?.tabBarItem.image = .SEARCH_UNSELECTED
        searchNavController?.tabBarItem.selectedImage = .SEARCH_SELECTED
        searchNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
        // Settings
        settingsNavController?.tabBarItem.image = .SETTINGS_UNSELECTED
        settingsNavController?.tabBarItem.selectedImage = .SEARCH_SELECTED
        settingsNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
    }
    
    private func getControllers() -> [UINavigationController] {
        if let collecNC = collectionsNavController,
           let searchNC = searchNavController,
           let settingsNC = settingsNavController {
            return [
                collecNC,
                searchNC,
                settingsNC
            ]
        } else {
            return []
        }
    }
    
    private func configTabBar() {
        tabBar.backgroundColor = .memoLightBackground
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.08
        tabBar.layer.cornerRadius = 21
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = .memoBlue
        tabBar.unselectedItemTintColor = .memoGray
        viewControllers = getControllers()
    }

}
