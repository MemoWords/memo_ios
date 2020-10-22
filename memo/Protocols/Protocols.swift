//
//  Protocols.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
protocol SaveWordDelegate: class {
    func save(collection: Collection?, collectionName: String?, word: String)
}
