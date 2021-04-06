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

    func setUpCardFront() {
        cardFront.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardFront.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 15),
            cardFront.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            cardFront.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            cardFront.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -20)
        ])
    }
    
    func setUpCardBack() {
        cardBack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardBack.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 15),
            cardBack.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            cardBack.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            cardBack.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -20)
        ])
    }
    
    func setUpCardMessage() {
        cardMessage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardMessage.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 15),
            cardMessage.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            cardMessage.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            cardMessage.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -20)
        ])
    }
}
