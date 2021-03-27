//
//  SearchView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 27/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension SearchView {
    func setupTextFieldView() {
        searchTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextFieldView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchTextFieldView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            searchTextFieldView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            searchTextFieldView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupTextField() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchTextFieldView.topAnchor, constant: 10),
            searchTextField.leftAnchor.constraint(equalTo: searchTextFieldView.leftAnchor),
            searchTextField.rightAnchor.constraint(equalTo: searchTextFieldView.rightAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchTextFieldView.bottomAnchor, constant: -10)
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
            card.topAnchor.constraint(equalTo: searchTextFieldView.bottomAnchor, constant: 20),
            card.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            card.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            card.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20)
        ])
    }
}
