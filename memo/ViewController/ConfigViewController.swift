//
//  ConfigViewController.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    // MARK: - Properties
    let configView = ConfigView()
    let settings = Settings.shared

    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = configView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .memoBackground
        configureNavBar()
        setUpTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView.tableView.reloadData()
    }

    // MARK: - Functions
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

        let image = UIImage(named: "back_button")
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

    func setUpTableView() {
        configView.tableView.delegate   = self
        configView.tableView.dataSource = self

        configView.tableView.register(
            UINib(nibName: NotificationTableViewCell.xibName, bundle: nil),
            forCellReuseIdentifier: NotificationTableViewCell.identifier
        )

        configView.tableView.register(
            UINib(nibName: ThemeTableViewCell.xibName, bundle: nil),
            forCellReuseIdentifier: ThemeTableViewCell.identifier
        )
    }

}

// MARK: - TableView DataSource
extension ConfigViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as! NotificationTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ThemeTableViewCell.identifier, for: indexPath) as! ThemeTableViewCell
            cell.configure(with: settings.getSelectedThemeName())
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            let themesController = ThemesViewController()
            navigationController?.pushViewController(themesController, animated: true)
        }
    }
}
