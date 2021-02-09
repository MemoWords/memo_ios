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
        label.font = UIFont(name: "SF Pro Text Bold", size: 32)
        label.textColor = .whiteColor
        return label
    }()

    // Labels
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "palavras para hoje"
        label.font = UIFont(name: "SF Pro Text Bold", size: 18)
        label.textColor = .whiteColor
        return label
    }()

    // MARK: - INIT

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.addSubviews(image, titleLabel, messageLabel)
        self.setUpImage()
        self.setUpLabels()
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
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.leftAnchor.constraint(equalTo: self.leftAnchor),
            image.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    func setUpLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
        ])

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ])
    }
}
