//
//  ConfigViewController.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .memoBackground
        configureNavBar()
    }

    func configureNavBar() {
        navigationItem.title = TabBarItems.settings.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .memoBlue

        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Bold", size: 30)!,
            NSAttributedString.Key.foregroundColor: UIColor.memoText
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Semibold", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.memoText
        ]

        let image = UIImage(systemName: "arrow.left")
        let backButton = UIBarButtonItem()
        backButton.title = ""
        // Set the back button.
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

}
