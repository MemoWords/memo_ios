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
    var selected: Bool
}

class ThemesViewController: UIViewController {
    // MARK: - Properties
    let themesView = ThemesView()
    var themes = [Theme]()

    override func loadView() {
        super.loadView()
        view = themesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .memoBackground
        themes = [
            Theme(title: "System", selected: true),
            Theme(title: "Light", selected: false),
            Theme(title: "Dark", selected: false)
        ]
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
}

// MARK: - Tableview DataSource
extension ThemesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        themes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .memoLightBackground
        cell.textLabel?.text = themes[indexPath.row].title
        cell.tintColor = .memoBlue
        cell.textLabel?.font = UIFont(name: "SF Pro Text Bold", size: 16)
        cell.textLabel?.tintColor = .memoText
        if themes[indexPath.row].selected {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        themes[indexPath.row].selected = true
        tableView.reloadData()
    }
}
