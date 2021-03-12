//
//  AddWordTableView.swift
//  memo
//
//  Created by Elias Ferreira on 28/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddWordTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        alwaysBounceVertical = true
        tableHeaderView = .none
        alwaysBounceHorizontal = false
        separatorInset = .zero
        showsVerticalScrollIndicator = false
        tableFooterView = UIView()
        separatorStyle = .none
        rowHeight = 93
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
