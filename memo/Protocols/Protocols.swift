//
//  Protocols.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//
import Foundation
// Protocol to call the function save on search screen
// from add screen.
protocol SaveWordDelegate: class {
    func save(collection: Collection?, collectionName: String?, word: String)
}

// Protocol to update the collections screen.
protocol CollectionPresenterDelegate: class {
    func reloadData(value: Bool)
}

// IndicatorView protocol
protocol Loadingprotocol: class {
    func setLoading(_ loading: Bool)
}

// MARK: - View Events Delegates
protocol ReviewViewEventsDelegate: class {
    func wrongButtonTapped()
    func hardButtonTapped()
    func easyButtonTapped()
    func showCardTapped()
    func endAction()
}

protocol CollectionsViewEventsDelegate: class {
    func addFolder()
}

protocol SearchViewEventsDelegate: class {
    func searchButtonTapped(_ word: String)
    func saveButtonTapped()
}

protocol AddWordViewEventsDelegate: class {
    func dismissKeyboard()
    func addButtonTapped()
}
