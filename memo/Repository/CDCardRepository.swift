//
//  CDCollectionRepository.swift
//  memo
//
//  Created by Elias Ferreira on 20/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit
import CoreData

class CDCardRepository {
    let context: NSManagedObjectContext
    let collectionRepository = CDCollectionRepository()
    var cards: [Card]?
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // Function to create a card.
    func create(collection: Collection, content: String) {
        let card = Card(context: self.context)
        card.collection = collection
        
        card.content = content
        card.nextStudyDay = DateHelper.today()
        card.lastDaysIncremented = 1
        
        self.save()
    }
    
    // Function to create a card with a new collection.
    func create(collectionName: String, content: String) {
        let collection = collectionRepository.create(name: collectionName)
        
        let card = Card(context: self.context)
        card.collection = collection
        
        card.content = content
        card.nextStudyDay = DateHelper.today()
        card.lastDaysIncremented = 1
        
        self.save()
    }
    
    // Function to fetch cards.
    func fetchCards() -> [Card] {
        do {
            self.cards = try self.context.fetch(Card.fetchRequest())
        } catch {
            print(error)
        }
        
        return self.cards!
    }
    
//    func getCardsWithCollection(name: String) -> [Card]? {
//        do {
//            let request = Card.fetchRequest() as NSFetchRequest<Card>
//            let predicate = NSPredicate(format: "Card.collection == %@", name)
//
//            request.predicate = predicate
//            self.cards = try context.fetch(request)
//        } catch {
//            print(error)
//        }
//
//        return self.cards
//    }
    
    func exists(word: String) -> Bool {
        do {
            let request = Card.fetchRequest() as NSFetchRequest<Card>
            let predicate = NSPredicate(format: "content == %@", word)
            request.predicate = predicate
            let card = try context.fetch(request)
            if card.count != 0 {
                return true
            } else {
                return false
            }
        } catch {
            print(error)
            return false
        }
    }
    
    func updateCardsToStudy() {
        let cards = self.fetchCards()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for card in cards {
            //let nowString = dateFormatter.string(from: now)

            let nextStudyDay = dateFormatter.date(from: card.nextStudyDay!)
            let now = dateFormatter.date(from: DateHelper.today())

            if nextStudyDay!.compare(now!) == .orderedAscending {
                card.nextStudyDay = dateFormatter.string(from: now!)
            }
        }
        
        self.save()
    }
    
    func save() {
        do {
            try self.context.save()
        } catch {
            print(error)
        }
    }
    
// TODO: Function to update a card.

}
