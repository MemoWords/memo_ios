//
//  CDCollectionRepositry.swift
//  memo
//
//  Created by Elias Ferreira on 21/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit
import CoreData

// Repository to the CRUD of Collections.
class CollectionRepository {
    // Properties.
    let context: NSManagedObjectContext
    var collections: [Collection]?
    var collectionsToStudy: [Collection]?
    
    // Initializer.
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.collections = try! context.fetch(Collection.fetchRequest())
        
        // Creates a Default collection if it doesn't exists.
        if self.collections?.count == 0 {
            let collection = Collection(context: self.context)
            collection.name = "Default"
            try! self.context.save()
        }
    }
    
// MARK: - FUNCS
    
    // Function to create a collection.
    func create(name: String) -> Collection {
        let collection = Collection(context: self.context)
        collection.name = name
        try! self.context.save()
        return collection
    }
    
    // Function to fetch all collectins.
    func fetchAll() -> [Collection] {
        self.collections = try! context.fetch(Collection.fetchRequest())
        return self.collections!
    }

    // Function to fetch collections to sutdy.
    func getCollectionsToStudy() -> [Collection] {
        let predicate = NSPredicate(format: "ANY cards.nextStudyDay = %@", DateHelper.today)
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = predicate

        self.collectionsToStudy = try! context.fetch(request)
        return self.collectionsToStudy!
    }
}
