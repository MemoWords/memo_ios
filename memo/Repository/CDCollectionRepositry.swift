//
//  CDCollectionRepositry.swift
//  memo
//
//  Created by Elias Ferreira on 21/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit
import CoreData

class CDCollectionRepository {
    let context: NSManagedObjectContext
    var collections: [Collection]?
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.collections = try! context.fetch(Collection.fetchRequest())
        
        if self.collections?.count == 0 {
            let collection = Collection(context: self.context)
            collection.name = "Default"
            try! self.context.save()
        }
    }
    
    func create(name: String) -> Collection {
        let collection = Collection(context: self.context)
        collection.name = name
        try! self.context.save()
        return collection
    }
    
    func fetchAll() -> [Collection] {
        self.collections = try! context.fetch(Collection.fetchRequest())
        return self.collections!
    }

}
