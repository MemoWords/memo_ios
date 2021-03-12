//
//  CardView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension CardView {
    func configureLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        pronunciationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pronunciationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -5),
            pronunciationLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    
    func configureSeparator() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: pronunciationLabel.bottomAnchor, constant: 15),
            separator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            separator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func configureImg() {
        img.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            img.centerXAnchor.constraint(equalTo: separator.centerXAnchor),
            img.heightAnchor.constraint(equalToConstant: 80),
            img.widthAnchor.constraint(equalTo: img.heightAnchor)
        ])
    }
    
    func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    func configureShowAnswerButton() {
        showAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showAnswerButton.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            showAnswerButton.centerXAnchor.constraint(equalTo: img.centerXAnchor)
        ])
    }
}
