//
//  CardTableView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.backgroundColor = .clear
        self.alwaysBounceVertical = true
        self.tableHeaderView = .none
        self.alwaysBounceHorizontal = false
        self.separatorInset = .zero
        self.tableFooterView = UIView()
        self.separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
