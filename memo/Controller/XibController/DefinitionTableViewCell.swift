//
//  DefinitionTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 18/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelDefinition: UILabel!
    @IBOutlet weak var labelExample: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(definition: Definition) {
        self.labelType.text = definition.type
        self.labelDefinition.text = definition.definition
        if let example = definition.example {
            self.labelExample.text = example
        } else {
            self.labelExample.text = ""
        }
    }
    
}
