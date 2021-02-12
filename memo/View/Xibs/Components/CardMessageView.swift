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
            titleLabel,
            bodyLabel
        )
        self.setUpLabels()
    }
}

// MARK: - CONSTRAINTS

extension CardMessageView {
    func setUpLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            bodyLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            bodyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)
        ])
    }
}
