//
//  Answer.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

// Struct to save the answer of a request to the API.
struct Answer: Codable {
    var word: String
    var pronunciation: String?
    var definitions: [Definition]
}
