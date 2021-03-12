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
            buttonsStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            buttonsStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            buttonsStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -17),
            buttonsStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpLabelsStack() {
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            labelsStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            labelsStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            labelsStack.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setUpCard() {
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: 10),
            card.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            card.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            card.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -17)
        ])
    }
    
    func setUpCardMessage() {
        cardMessage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardMessage.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: 10),
            cardMessage.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            cardMessage.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            cardMessage.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -17)
        ])
    }
}
