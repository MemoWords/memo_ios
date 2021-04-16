//
//  CardMessageView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardMessageView: UIView {
    
    // MARK: - UI

    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🎉"
        label.font = .memoMedium(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Você revisou tudo por aqui!"
        label.font = .memoMedium(ofSize: 24)
        label.textColor = .memoText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Aguarde o próximo dia de estudos ou adicione mais palavras a esta coleção clicando na aba pesquisar logo abaixo."
        label.font = .memoMedium(ofSize: 17)
        label.textColor = .memoGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var endButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINALIZAR", for: .normal)
        button.titleLabel?.font = .memoMedium(ofSize: 16)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoBlue
        button.addTarget(self, action: #selector(end), for: .touchUpInside)
        return button
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

    // MARK: - ACTIONS
    // End Button Action
    var endAction: (() -> Void)!
    @objc func end(sender: UIButton!) { endAction() }
    
    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 4
        layer.shadowOffset = .init(width: 1, height: 3)
        endButton.layer.cornerRadius = 16
    }
    
    func setUpViews() {
        addSubviews(
            emojiLabel,
            titleLabel,
            bodyLabel,
            endButton
        )
        setUpConstraints()
    }
}

// MARK: - CONSTRAINTS

extension CardMessageView {
    func setUpConstraints() {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        endButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            emojiLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            emojiLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            emojiLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            bodyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            bodyLabel.bottomAnchor.constraint(equalTo: endButton.topAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            endButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            endButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            endButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            endButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
}
