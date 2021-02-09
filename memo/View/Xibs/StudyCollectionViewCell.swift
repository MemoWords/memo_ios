//
//  StudyCollectionViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class StudyCollectionViewCell: UICollectionViewCell {

    // Items
    @IBOutlet weak var mainFrame: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Style.
        mainFrame.layer.cornerRadius = 20
        mainFrame.layer.cornerRadius = 20
        mainFrame.layer.shadowColor = UIColor.black.cgColor
        mainFrame.layer.shadowOpacity = 0.35
        mainFrame.layer.shadowRadius = 4
        mainFrame.layer.shadowOffset = .init(width: 0, height: 3)
    }

    // Prepare the cell for reuse at the table.
    override func prepareForReuse() {
        titleLabel.text = nil
        bodyLabel.text = nil
    }

}
