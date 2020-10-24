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
        // Style.
        mainFrame.layer.cornerRadius = 20
        background.layer.cornerRadius = 20
        mainFrame.layer.shadowColor = UIColor.black.cgColor
        mainFrame.layer.shadowOpacity = 0.35
        mainFrame.layer.shadowRadius = 4
        mainFrame.layer.shadowOffset = .init(width: 0, height: 3)
    }
    
    // Prepare the cell for reuse at the table.
    override func prepareForReuse() {
        labelTitle.text = nil
        labelTotal.text = nil
        labelStudy.text = nil
    }
    
    // Configure the data to apear at the cell.
    func configure(collection: Collection) {
        var study: Int = 0
        
        for card in collection.cards! {
            if DateHelper.isToday(dateString: (card as! Card).nextStudyDay!) {
                study += 1
            }
        }
        
        self.labelTitle.text = collection.name
        self.labelTotal.text = String("Total: \(collection.cards!.count)")
        self.labelStudy.text = String("Estudar: \(study)")
    }
    
}
