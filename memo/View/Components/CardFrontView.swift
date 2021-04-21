//
//  CardView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardFrontView: UIView {

    // MARK: - UIELEMENTS

    // Labels
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "car"
        label.font = .memoMedium(ofSize: .large)
        label.textColor = .memoText
        return label
    }()

    lazy var pronunciationLabel: UILabel = {
        let label = UILabel()
        label.text = "/kär/"
        label.font = .memoMedium(ofSize: .mediumLarge)
        label.textColor = .memoGray
        return label
    }()

    lazy var touchLabel: UILabel = {
        let label = UILabel()
        label.text = "Toque no card para virar 􀬂"
        label.font = .memoMedium(ofSize: .normal)
        label.textColor = .memoGray
        return label
    }()

    // MARK: - INIT

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoLightBackground
        setUpViews()
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

    func setUpViews() {
        addSubviews(
            titleLabel,
            pronunciationLabel,
            touchLabel
        )
        setUpConstraints()
    }
}

extension CardFrontView {
    func setUpConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        pronunciationLabel.translatesAutoresizingMaskIntoConstraints = false
        touchLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            pronunciationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pronunciationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            touchLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            touchLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
