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
        label.font = UIFont(name: "SF Pro Text Medium", size: 30)
        label.textColor = .memoText
        return label
    }()
    
    lazy var pronunciationLabel: UILabel = {
        let label = UILabel()
        label.text = "/kär/"
        label.font = UIFont(name: "SF Pro Text Medium", size: 20)
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
        addSubviews(
            titleLabel,
            pronunciationLabel,
            separator,
            tableView
        )
        
        configureLabels()
        configureSeparator()
        configureTableView()
    }
}
