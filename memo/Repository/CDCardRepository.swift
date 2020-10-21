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
    var cards: [Card]?
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // Function to create a card.
    func create(content: String) {
        let card = Card(context: self.context)
        card.content = content
        card.nextStudyDay = DateHelper.today()
        card.lastDaysIncremented = 1
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
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
    
// TODO: Function to search a word.
// TODO: Function to update a card.
// TODO: Function to update all cards.

}
