//
//  NotificationTableViewCell.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    static let xibName = "NotificationTableViewCell"
    static let identifier = "NotificationCell"

    @IBOutlet weak var notifySwitch: UISwitch!

    @IBAction func notifySwitchValueChanged(_ sender: Any) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
