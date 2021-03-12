//
//  SearchView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 27/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension SearchView {
    func setupTextField() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            searchTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupButton() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupCard() {
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            card.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            card.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            card.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20)
        ])
    }
}
