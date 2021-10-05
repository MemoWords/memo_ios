//
//  DefinitionTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 18/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {

    // Itens on screen.
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelDefinition: UILabel!
    @IBOutlet weak var labelExample: UILabel!

    static let identifier = "DefinitionCell"
    static let nibName = "DefinitionTableViewCell"
    
    // Runs when the view is loaded.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Configure the data to apear at the cell.
    func configure(definition: Definition) {
        labelType.text = definition.type
        labelDefinition.text = definition.definition
        if let example = definition.example {
            let example = example.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            labelExample.text = "\"\(example)\""
        } else {
            labelExample.text = ""
        }
    }
    
}
