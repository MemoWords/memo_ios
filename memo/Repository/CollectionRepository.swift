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
    let fileUrl = URL(fileURLWithPath: NSHomeDirectory()+"/Documents/cards.json")
    
    // Initializer
    init() {
        // It creates the file if the same doesn`t exist.
        if (!FileManager.default.fileExists(atPath: fileUrl.path)) {
            do {
                let jsonData = try JSONEncoder().encode([
                    Collection(
                        name: "Default",
                        cards: [Card]()
                    )
                ])
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
    
    // Search for a word.
    func searchWord(word: String) -> Bool {
        var result = false
        for collection in self.collections {
            for card in collection.cards {
                if card.content == word {
                    result = true
                }
            }
        }
        return result
    }
    
    func updateCardsToStudy() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for collection in self.collections {
            for card in collection.cards {
                //let nowString = dateFormatter.string(from: now)

                let nextStudyDay = dateFormatter.date(from: card.nextStudyDay)
                let now = dateFormatter.date(from: Helper.today())

                if nextStudyDay!.compare(now!) == .orderedAscending  {
                    card.nextStudyDay = dateFormatter.string(from: now!)
                }
            }
        }
        self.save()
    }
}
