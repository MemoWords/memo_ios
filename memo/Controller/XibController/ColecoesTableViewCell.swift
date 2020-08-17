//
//  ColecoesTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 17/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ColecoesTableViewCell: UITableViewCell {

    // Itens on screen.
    @IBOutlet weak var mainFrame: UIView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelStudy: UILabel!
    
    // Runs when the view is loaded.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // rounded corners of the layer.
        mainFrame.layer.cornerRadius = 20
        background.layer.cornerRadius = 20
        // Shadow configs of the main frame.
        mainFrame.layer.shadowColor = UIColor.black.cgColor
        mainFrame.layer.shadowOpacity = 0.35
        mainFrame.layer.shadowRadius = 4
        mainFrame.layer.shadowOffset = .init(width: 0, height: 3)
    }
    
    // Prepare the cell for reuse at the table.
    override func prepareForReuse() {
        <#code#>
    }
    
    // Configure the data to apear at the cell.
    func configure() {
        <#code#>
    }
    
}
