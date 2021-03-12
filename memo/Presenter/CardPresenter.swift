//
//  CardPresenter.swift
//  memo
//
//  Created by Elias Ferreira on 17/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import Foundation

class CardPresenter {
    let cardRepository: CardRepository
    let collection: Collection

    init(collection: Collection) {
        cardRepository = CardRepository()
        self.collection = collection
    }

    func delete(card: Card) {
        cardRepository.delete(card: card)
    }
}
