//
//  Definition.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name

class Definition: Codable {
    var type: String
    var definition: String
    var example: String?
    var image_url: String?
    var emoji: String?
    
    init(type: String, definition: String, example: String, image_url: String, emoji: String) {
        self.type       = type
        self.definition = definition
        self.example    = example
        self.image_url  = image_url
        self.emoji = emoji
    }
}
