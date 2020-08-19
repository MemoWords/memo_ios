//
//  CardStruct.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class CardStruct: Codable {
    // Properties
    var name: String
    var cards: [Card]
    
    //Initializer
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
    }
}
