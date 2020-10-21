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
    var collection: [Collection]?
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.collection = try! context.fetch(Collection.fetchRequest())
        
        if self.collection?.count == 0 {
            let collection = Collection(context: self.context)
            collection.name = "default"
            
            try! self.context.save()
        }
    }
    
    func fetchAll() -> [Collection] {
        self.collection = try! context.fetch(Collection.fetchRequest())
        return self.collection!
    }
}
