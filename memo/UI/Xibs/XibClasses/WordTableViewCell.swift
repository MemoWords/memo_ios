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

    static let identifier = "WordCell"
    static let nibName = "WordTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        mainFrame.layer.cornerRadius = 18
        mainFrame.layer.shadowColor = UIColor.black.cgColor
        mainFrame.layer.shadowOpacity = 0.08
        mainFrame.layer.shadowRadius = 4
        mainFrame.layer.shadowOffset = .init(width: 1, height: 3)
    }

    func configure(card: Card) {
        titleLabel.text = card.content
        dateLabel.text = card.nextStudyDay
    }
    
}
