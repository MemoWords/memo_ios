//
//  CardView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardBackView: UIView {
    
    // MARK: - UIELEMENTS
    
    // Labels
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "car"
        label.font = .memoMedium(ofSize: .large)
        label.textColor = .memoText
        return label
    }()
    
    lazy var pronunciationLabel: UILabel = {
        let label = UILabel()
        label.text = "/kär/"
        label.font = .memoMedium(ofSize: .mediumLarge)
        label.textColor = .memoGray
        return label
    }()
    
    // Separator
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .memoGray
        return view
    }()

    // HeaderView
    lazy var headerView: DefinitionTableViewHeader = {
        let view = DefinitionTableViewHeader()
        view.frame.size.height = 80
        return view
    }()

    // TableView
    let tableView = MemoTableView(frame: .zero, style: .plain)
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoLightBackground
        tableView.tableHeaderView = headerView
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 4
        layer.shadowOffset = .init(width: 1, height: 3)
    }
    
    func setUpViews() {
        addSubviews(titleLabel, pronunciationLabel, separator, tableView)
        setUpConstraints()
    }
}

// MARK: - CONSTRAINTS
extension CardBackView {
    func setUpConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        pronunciationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pronunciationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -5),
            pronunciationLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: pronunciationLabel.bottomAnchor, constant: 10),
            separator.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            separator.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
