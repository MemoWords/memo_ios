//
//  Card.swift
//  memo
//
//  Created by Elias Ferreira on 07/04/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class CardView: UIView {
    // MARK: - PROPERTIES
    var isFlipped: Bool

    // MARK: - UI
    let front = CardFrontView()
    let back = CardBackView()
    let message = CardMessageView()

    // MARK: - INIT

    override init(frame: CGRect) {
        isFlipped = false
        super.init(frame: frame)
        configViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 4
        layer.shadowOffset = .init(width: 1, height: 3)
    }

    func configViews() {
        addSubviews(
            message,
            back,
            front
        )
        setUpConstraints()
    }

    // MARK: - ANIMATIONS
    func showContent() {
        if !isFlipped {
            isFlipped = true
            UIView.transition(
                from: front,
                to: back,
                duration: 0.5,
                options: [.transitionFlipFromLeft, .showHideTransitionViews],
                completion: nil)
        }
    }

    func hideContent() {
        if isFlipped {
            isFlipped = false
            UIView.transition(
                from: back,
                to: front,
                duration: 0.5,
                options: [.transitionFlipFromLeft, .showHideTransitionViews],
                completion: nil)
        }
    }

    func showMessage() {
        if isFlipped {
            UIView.transition(
                from: back,
                to: message,
                duration: 0.5,
                options: [.transitionCrossDissolve],
                completion: nil)
        } else {
            isFlipped = true
            UIView.transition(
                from: front,
                to: message,
                duration: 0.5,
                options: [.transitionCrossDissolve],
                completion: nil)
        }
    }
}

// MARK: - CONSTRAINTS
extension CardView {
    func setUpConstraints() {
        front.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            front.topAnchor.constraint(equalTo: topAnchor),
            front.leftAnchor.constraint(equalTo: leftAnchor),
            front.rightAnchor.constraint(equalTo: rightAnchor),
            front.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        back.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            back.topAnchor.constraint(equalTo: topAnchor),
            back.leftAnchor.constraint(equalTo: leftAnchor),
            back.rightAnchor.constraint(equalTo: rightAnchor),
            back.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        message.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            message.rightAnchor.constraint(equalTo: rightAnchor),
            message.centerYAnchor.constraint(equalTo: centerYAnchor),
            message.leftAnchor.constraint(equalTo: leftAnchor),
            message.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
    }
}
