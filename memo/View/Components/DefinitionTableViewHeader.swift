//
//  DefinitionTableViewHeader.swift
//  memo
//
//  Created by Elias Ferreira on 27/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class DefinitionTableViewHeader: UIView {
    // MARK: - UI

    // Image.
    lazy var img: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "photo"))
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(img)
        setUpConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        img.layer.cornerRadius = img.frame.size.height / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CONSTRAINTS.
extension DefinitionTableViewHeader {
    func setUpConstraints() {
        img.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: topAnchor),
            img.centerXAnchor.constraint(equalTo: centerXAnchor),
            img.heightAnchor.constraint(equalToConstant: 80),
            img.widthAnchor.constraint(equalTo: img.heightAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
