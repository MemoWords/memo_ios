//
//  Protocols.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//
import Foundation
// Protocol to call the function save on search screen
// from add screen.
protocol SaveWordDelegate: class {
    func save(collection: Collection?, collectionName: String?, word: String)
}

// Protocol to update the collections screen.
protocol CollectionPresenterDelegate: class {
    func reloadData(value: Bool)
}
