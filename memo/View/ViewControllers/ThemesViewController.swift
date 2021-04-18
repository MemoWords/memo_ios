//
//  ThemesViewController.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit
struct Theme {
    let title: String
}

class ThemesViewController: UIViewController {
    // MARK: - Properties
    let themesView = ThemesView()
    let settings = Settings.shared

    override func loadView() {
        super.loadView()
        view = themesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .memoBackground
        configNavBar()
        setUpTableview()
    }

    // MARK: - Functions
    func setUpTableview() {
        themesView.tableView.delegate   = self
        themesView.tableView.dataSource = self
    }

    func configNavBar() {
        navigationItem.title = "Temas"
        navigationItem.largeTitleDisplayMode = .never
    }

    func updateTheme(theme: UIUserInterfaceStyle) {
        settings.theme = theme
        themesView.tableView.reloadData()
        UIView.transition(
            with: self.view,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.view.window?.overrideUserInterfaceStyle = theme
            },
            completion: nil
        )
    }
}

// MARK: - Tableview DataSource
extension ThemesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.themeNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .memoLightBackground
        cell.textLabel?.text = settings.themeNames[indexPath.row]
        cell.tintColor = .memoBlue
        cell.selectionStyle = .none
        cell.textLabel?.font = .memoBold(ofSize: 16)
        cell.textLabel?.tintColor = .memoText
        if settings.theme.rawValue == indexPath.row {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        updateTheme(theme: UIUserInterfaceStyle(rawValue: indexPath.row) ?? .unspecified)
    }
}
