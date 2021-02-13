//
//  CollectionsPresenter.swift
//  memo
//
//  Created by Elias Ferreira on 12/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class CollectionsPresenter {
	// data
    weak var delegate: CollectionPresenterDelegate?
    let collectionRepository: CollectionRepository

    var collections: [Collection] {
        didSet {
            delegate!.reloadData(value: true)
        }
    }

    var collectionsToStudy: [Collection] {
        didSet {
            if collectionsToStudy.count == 0 {
                delegate!.reloadData(value: false)
            } else {
                delegate!.reloadData(value: true)
            }
        }
    }

	init() {
        collectionRepository = CollectionRepository()
        collections = collectionRepository.fetchAll()
        collectionsToStudy = collectionRepository.getCollectionsToStudy()
	}

    func updateData() {
        collections = collectionRepository.fetchAll()
        collectionsToStudy = collectionRepository.getCollectionsToStudy()
    }

    func add(name: String) {
        collectionRepository.create(name: name)
    }

}
