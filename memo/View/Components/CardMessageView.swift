//
//  CardMessageView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardMessageView: UIView {
    
    // MARK: - LABELS
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Você revisou tudo por aqui!"
        label.font = UIFont(name: "SF Pro Text Medium", size: 24)
        label.textColor = .memoBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Aguarde o próximo dia de estudos ou adicione mais palavras a esta coleção clicando na aba pesquisar logo abaixo."
        label.font = UIFont(name: "SF Pro Text Medium", size: 17)
        label.textColor = .memoDarkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoWhite
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.memoDarkGray.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 6
        layer.shadowOffset = .init(width: 0, height: 3)
    }
    
    func setUpViews() {
        addSubviews(
            titleLabel,
            bodyLabel
        )
        setUpLabels()
    }
}

// MARK: - CONSTRAINTS

extension CardMessageView {
    func setUpLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            bodyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            bodyLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10)
        ])
    }
}
