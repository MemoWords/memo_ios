//
//  CollectionsTableView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CollectionsTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        alwaysBounceVertical = true
        tableHeaderView = .none
        alwaysBounceHorizontal = false
        separatorInset = .zero
        tableFooterView = UIView()
        separatorStyle = .none
        rowHeight = 96
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
