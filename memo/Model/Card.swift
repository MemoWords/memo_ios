//
//  Card.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class Card: Codable {
    // Properties
    var content: String
    var nextStudyDay: String
    var lastDaysIncremented: Int
    
     //Initializer
    init(content: String, nextStudyDay: String) {
        self.content = content
        self.nextStudyDay = nextStudyDay
        self.lastDaysIncremented = 1
    }
}
