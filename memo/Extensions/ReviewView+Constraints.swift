//
//  ReviewView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension ReviewView {
    func setUpButtonsStack() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            buttonsStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            buttonsStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpLabel() {
        labelStudy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStudy.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStudy.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
    }

    func setUpCard() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 15),
            cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            cardView.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -20)
        ])
    }
}
