//
//  ConfigView.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class ConfigView: UIView {
    // MARK: - UI
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .memoLightBackground
        view.layer.shadowOpacity = 0.08
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = .init(width: 1, height: 3)
        return view
    }()

    lazy var tableView: MemoTableView = {
        let tableView = MemoTableView(frame: .zero, style: .plain)
        tableView.rowHeight = 60
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .memoGray
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return tableView
    }()

    lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.text = "Versão: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String) - bravo"
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
        label.textColor = .memoGray
        return label
    }()

    let bugView = UIView()

    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tableView)
        addSubviews(bugView, contentView, versionLabel)
        setUpContentView()
        setUpTableView()
        setUpLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 22
        tableView.layer.cornerRadius = 22
    }
}

// MARK: - EXTENSIONS
extension ConfigView {
    func setUpContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            contentView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            contentView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func setUpLabel() {
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            versionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            versionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
