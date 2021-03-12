//
//  AddWordView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 28/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension AddWordView {
    func setupLabel() {
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            createLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            createLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)
        ])
    }
    
    func setupTextField() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 12),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            addButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLabels() {
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 35),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectLabel.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 25),
            selectLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            selectLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)
        ])
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
