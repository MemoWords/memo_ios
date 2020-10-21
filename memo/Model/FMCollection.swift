//
//  CardStruct.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class FMCollection: Codable {
    // Properties
    var name: String
    var cards: [FMCard]
    
    //Initializer
    init(name: String, cards: [FMCard]) {
        self.name = name
        self.cards = cards
    }
}
