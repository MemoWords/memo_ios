//
//  Answer.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class Answer: Codable {
    //var status_code: Int
    var word: String
    var pronunciation: String?
    var definitions: [Definition]
    
    init(word: String, pronunciation: String, definitions: [Definition]) {
        //self.status_code   = status_code
        self.word          = word
        self.pronunciation = pronunciation
        self.definitions   = definitions
    }
}
