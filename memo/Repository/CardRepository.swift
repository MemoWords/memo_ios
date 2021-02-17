//
//  CDCollectionRepository.swift
//  memo
//
//  Created by Elias Ferreira on 20/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit
import CoreData

class CardRepository {
    
    // Properties.
    let context: NSManagedObjectContext
    let collectionRepository = CollectionRepository()
    var cards: [Card]?
    
    // Initializer.
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
// MARK: - FUNCS.
    
    // Function to create a card with an existing collection.
    func create(collection: Collection, content: String) {
        let card = Card(context: self.context)
        card.collection = collection
        
        card.content = content
        card.nextStudyDay = DateHelper.today
        card.lastDaysIncremented = 1
        
        self.save()
    }
    
    // Function to create a card with a new collection.
    func create(collectionName: String, content: String) {
        let collection = collectionRepository.create(name: collectionName)
        let card = Card(context: self.context)
        card.collection = collection
        
        card.content = content
        card.nextStudyDay = DateHelper.today
        card.lastDaysIncremented = 1
        
        self.save()
    }
    
    // Function to fetch all cards.
    func fetchCards() -> [Card] {
        do {
            self.cards = try self.context.fetch(Card.fetchRequest())
        } catch {
            print(error)
        }
        
        return self.cards!
    }
    
    // function to verify if a card exists.
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
    
    // function to update all cards.
    func updateCardsToStudy() {
        let cards = self.fetchCards()
        
        for card in cards {
            //let nowString = dateFormatter.string(from: now)

            let nextStudyDay = DateHelper.dateFromString(date: card.nextStudyDay!)
            let now = DateHelper.dateFromString(date: DateHelper.today)

            if nextStudyDay.compare(now) == .orderedAscending {
                card.nextStudyDay = DateHelper.today
            }
        }
        
        self.save()
    }

    func delete(card: Card) {
        context.delete(card)
        save()
    }
    
    // function to save the context.
    func save() {
        do {
            try self.context.save()
        } catch {
            print(error)
        }
    }

}
