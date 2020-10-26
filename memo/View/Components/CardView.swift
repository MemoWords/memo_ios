//
//  CardView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardView: UIView {
    // MARK: - UIELEMENTS
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "car"
        label.textColor = .memoBlack
        return label
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .memoWhite
        self.setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.memoDarkGray.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = .init(width: 0, height: 3)
    }
    
    func setUpViews() {
        self.addSubviews(
            titleLabel
        )
        
        self.setUpLabels()
    }
}

// MARK: - CONSTRAINTS

extension CardView {
    func setUpLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
