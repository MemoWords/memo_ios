//
//  AddWordTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 22/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddWordTableViewCell: UITableViewCell {

    // Intens on screen.
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    // Runs when the view is loaded.
    override func awakeFromNib() {
        super.awakeFromNib()
        card.layer.cornerRadius = 20
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.08
        card.layer.shadowRadius = 4
        card.layer.shadowOffset = .init(width: 1, height: 3)
    }
    
    // Configure the data to apear at the cell.
    func configure(name: String) {
        labelTitle.text = name
    }
    
}
