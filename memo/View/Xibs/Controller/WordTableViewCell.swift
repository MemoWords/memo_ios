//
//  WordTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {

    @IBOutlet weak var mainFrame: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mainFrame.layer.cornerRadius = 18
        mainFrame.layer.shadowColor = UIColor.black.cgColor
        mainFrame.layer.shadowOpacity = 0.03
        mainFrame.layer.shadowRadius = 3
        mainFrame.layer.shadowOffset = .init(width: 1, height: 2)
    }

    func configure(card: Card) {
        titleLabel.text = card.content
        dateLabel.text = card.nextStudyDay
    }
    
}
