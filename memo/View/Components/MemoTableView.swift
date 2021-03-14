//
//  MemoTableView.swift
//  memo
//
//  Created by Elias Ferreira on 12/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class MemoTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        alwaysBounceVertical = true
        alwaysBounceHorizontal = false
        tableHeaderView = .none
        separatorInset = .zero
        separatorStyle = .none
        tableHeaderView = UIView()
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 1))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
