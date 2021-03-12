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

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
		let collectionsPresenter = CollectionsPresenter()
		collectionsNavController = UINavigationController(rootViewController: CollectionsViewController(with: collectionsPresenter))
        searchNavController = UINavigationController(rootViewController: SearchViewController())
        configNavController = UINavigationController(rootViewController: ConfigViewController())
        configItems()
        configTabBar()
    }

    // MARK: - Functions
    private func configItems() {
        collectionsNavController?.tabBarItem.image = UIImage(named: "foldert_unselected")
        collectionsNavController?.tabBarItem.selectedImage = UIImage(named: "foldert")
        collectionsNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)

        searchNavController?.tabBarItem.image = UIImage(named: "search_unselected")
        searchNavController?.tabBarItem.selectedImage = UIImage(named: "search")
        searchNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)

        configNavController?.tabBarItem.image = UIImage(named: "settings_unselected")
        configNavController?.tabBarItem.selectedImage = UIImage(named: "settings")
        configNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
    }
    
    private func getControllers() -> [UINavigationController] {
        return [
            collectionsNavController!,
            searchNavController!,
            configNavController!
        ]
    }
    
    private func configTabBar() {
        overrideUserInterfaceStyle = .light
        tabBar.tintColor = .primaryColor
        tabBar.backgroundColor = .whiteColor
        tabBar.unselectedItemTintColor = .bodyColor
        tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 0
        tabBar.clipsToBounds = true
        viewControllers = getControllers()
    }

}
