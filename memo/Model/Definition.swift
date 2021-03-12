//
//  Definition.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

// Struct to save the definitions of a word.
struct Definition: Codable {
    var type: String
    var definition: String
    var example: String?
    var image_url: String?
    var emoji: String?
}
