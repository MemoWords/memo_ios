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
            searchTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupButton() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            saveButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupCard() {
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            card.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            card.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            card.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20)
        ])
    }
}
