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
        collectionsNavController = UINavigationController(rootViewController: CollectionsViewController())
        searchNavController = UINavigationController(rootViewController: SearchViewController())
        configNavController = UINavigationController(rootViewController: ConfigViewController())
        configItems()
        configTabBar()
    }

    // MARK: - Functions
    private func configItems() {
        collectionsNavController?.tabBarItem.image = UIImage(named: "folder_unselected")
        collectionsNavController?.tabBarItem.selectedImage = UIImage(named: "folder")
        collectionsNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)

        searchNavController?.tabBarItem.image = UIImage(named: "lens_unselected")
        searchNavController?.tabBarItem.selectedImage = UIImage(named: "lens_bold")
        searchNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)

        configNavController?.tabBarItem.image = UIImage(named: "gear_unselected")
        configNavController?.tabBarItem.selectedImage = UIImage(named: "gear")
        configNavController?.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
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
