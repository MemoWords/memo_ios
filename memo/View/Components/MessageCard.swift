//
//  MessageCard.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class MessageCard: UIView {

    // Image.
    lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background_large"))
        imageView.clipsToBounds = true
        return imageView
    }()

    // Labels
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: "SF Pro Text Bold", size: 30)
        label.textColor = .memoWhite
        return label
    }()

    // Labels
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "palavras para hoje"
        label.font = UIFont(name: "SF Pro Text Bold", size: 20)
        label.textColor = .memoWhite
        return label
    }()

    // MARK: - INIT

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
        layer.shadowOffset = .init(width: 1, height: 3)
        addSubviews(image, titleLabel, messageLabel)
        setUpImage()
        setUpLabels()
    }

    override func layoutSubviews() {
        image.layer.cornerRadius = 22
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageCard {
    func setUpImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

    func setUpLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
}
