//
//  ReviewView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension ReviewView {
    func setUpLabels() {
        // Label Study
        labelStudy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStudy.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelStudy.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            labelStudy.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Label Total
        labelTotal.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTotal.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelTotal.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            labelTotal.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setUpStack() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 17),
            buttonsStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -17),
            buttonsStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -17),
            buttonsStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
