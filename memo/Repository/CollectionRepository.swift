//
//  Collection.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class CollectionRepository {
    // Variables
    var collections = [Collection]()
    let home: URL // Directory home
    let fileUrl: URL // Url to the file.
    
    // Initializer
    init() {
        home = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileUrl = home.appendingPathComponent("cards.json")
        
        // It creates the file if the same doesn`t exist.
        if (!FileManager.default.fileExists(atPath: fileUrl.path)) {
            do {
                let jsonData = try JSONEncoder().encode([Collection]())
                try jsonData.write(to: fileUrl)
            } catch {
                print("Impossível escrever no arquivo.")
            }
        }
        // Load the collection from file.
        self.reload()
    }
    
    // Temporaly function to clear the file.
    func clear() {
        self.collections = [Collection]()
        self.save()
    }

    // Function to create a new collection.
    func create(collection: Collection) {
        self.collections.append(collection)
        self.save()
    }
    
    // Function to save the collections.
    func save() {
        do {
            let data = try JSONEncoder().encode(self.collections)
            try data.write(to: fileUrl)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    // Load the data.
    func reload() {
        do {
            let data = try Data(contentsOf: fileUrl)
            self.collections = try JSONDecoder().decode([Collection].self, from: data)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
