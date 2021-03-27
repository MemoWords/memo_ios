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
            createLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            createLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            createLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)
        ])
    }
    func setUpAddFolderView() {
        addFolderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addFolderView.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 16),
            addFolderView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            addFolderView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: addFolderView.topAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: addFolderView.leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: addFolderView.rightAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            addButton.leftAnchor.constraint(equalTo: addFolderView.leftAnchor, constant: 20),
            addButton.rightAnchor.constraint(equalTo: addFolderView.rightAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: addFolderView.bottomAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLabels() {
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: addFolderView.bottomAnchor, constant: 25),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectLabel.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            selectLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            selectLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)
        ])
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
