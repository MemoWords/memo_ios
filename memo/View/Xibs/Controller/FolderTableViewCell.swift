//
//  FolderTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class FolderTableViewCell: UITableViewCell {

  @IBOutlet weak var mainFrame: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!

  override func awakeFromNib() {
        super.awakeFromNib()
        mainFrame.layer.cornerRadius = 18
        mainFrame.layer.shadowColor = UIColor.black.cgColor
        mainFrame.layer.shadowOpacity = 0.05
        mainFrame.layer.shadowRadius = 4
        mainFrame.layer.shadowOffset = .init(width: 1, height: 3)
    }

    override func prepareForReuse() {
        titleLabel.text = nil
        bodyLabel.text = nil
    }

    func configure(collection: Collection) {
        titleLabel.text = collection.name
        bodyLabel.text = String("\(collection.cards!.count) Palavras")
    }
    
}
