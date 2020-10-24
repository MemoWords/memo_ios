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
        self.card.layer.cornerRadius = 20
    }
    
    // Configure the data to apear at the cell.
    func configure(name: String) {
        self.labelTitle.text = name
    }
    
}
