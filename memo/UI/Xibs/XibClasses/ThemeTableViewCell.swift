//
//  ThemeTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {

    static let nibName = "ThemeTableViewCell"
    static let identifier = "ThemeCell"

    @IBOutlet weak var themeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configure(with theme: String) {
        themeLabel.text = theme
    }
    
}
