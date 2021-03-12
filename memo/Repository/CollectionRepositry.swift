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
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        _ = fetchAll()
        // Creates a Default collection if it doesn't exists.
        if collections?.count == 0 {
            let collection = Collection(context: context)
            collection.name = "Default"
            try! context.save()
        }
    }
    
// MARK: - FUNCS
    
    // Function to create a collection.
    func create(name: String) -> Collection {
        let collection = Collection(context: context)
        collection.name = name
        try! context.save()
        return collection
    }
    
    // Function to fetch all collectins.
    func fetchAll() -> [Collection] {
        collections = try! context.fetch(Collection.fetchRequest())
        return collections!
    }

    // Function to fetch collections to sutdy.
    func getCollectionsToStudy() -> [Collection] {
        let predicate = NSPredicate(format: "ANY cards.nextStudyDay = %@", DateHelper.today)
        let request: NSFetchRequest<Collection> = Collection.fetchRequest()
        request.predicate = predicate

        collectionsToStudy = try! context.fetch(request)

        try! context.save()

        return collectionsToStudy!
    }

    func delete(at: Int) {
        let obj = collections![at]

        for card in collections![at].cards! {
            context.delete(card as! NSManagedObject)
        }

        context.delete(obj)
        save()
    }
    
    // function to save the context.
    func save() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
