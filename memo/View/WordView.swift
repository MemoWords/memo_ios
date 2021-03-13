//
//  WordView.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class WordView: UIView {

    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
        label.textColor = .memoGray
        return label
    }()

    lazy var tableView: MemoTableView = {
        let tableView = MemoTableView(frame: .zero, style: .plain)
        tableView.allowsSelection = false
        tableView.rowHeight = 76
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoBackground
        addSubviews(totalLabel, tableView)
        setUpLabel()
        setUpTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension WordView {
    func setUpLabel() {
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            totalLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 22),
            totalLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -22)
        ])
    }

    func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
