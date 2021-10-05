//
//  ReviewView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ReviewView: UIView {

    // MARK: - PROPERTIES
    weak var handler: ReviewViewHandleEvents?
    
    // MARK: - UIELEMENTS
    
    // Labels
    lazy var labelStudy: UILabel = {
        let label = UILabel()
        label.text = "\(Strings.STUDY.uppercased()): 0"
        label.font = .memoMedium(ofSize: .normal)
        label.textColor = .memoGray
        return label
    }()
    
    // Buttons
    lazy var wrongButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.DONT_KNOW_BUTTON_TITLE.uppercased(), for: .normal)
        button.titleLabel?.font = .memoMedium(ofSize: .normal)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoRed
        button.addTarget(self, action: #selector(wrongAction), for: .touchUpInside)
        return button
    }()
    
    lazy var hardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.HARD_BUTTON_TITLE.uppercased(), for: .normal)
        button.titleLabel?.font = .memoMedium(ofSize: .normal)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoBlue
        button.addTarget(self, action: #selector(hardAction), for: .touchUpInside)
        return button
    }()
    
    lazy var easyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.EASY_BUTTON_TITLE.uppercased(), for: .normal)
        button.titleLabel?.font = .memoMedium(ofSize: .normal)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoGreen
        button.addTarget(self, action: #selector(easyAction), for: .touchUpInside)
        return button
    }()
    
    // Stacks
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        stack.spacing = 20
        return stack
    }()
    
    // Cards
    let cardView = CardView()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoBackground
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        cardView.addGestureRecognizer(tap)
        cardView.message.endButton.addTarget(self, action: #selector(endAction), for: .touchUpInside)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ACTIONS
    @objc func wrongAction(sender: UIButton!) {
        handler?.wrongButtonTapped()
    }

    @objc func hardAction(sender: UIButton!) {
        handler?.hardButtonTapped()
    }

    @objc func easyAction(sender: UIButton!) {
        handler?.easyButtonTapped()
    }

    @objc func cardTapped() {
        handler?.showCardTapped()
    }

    @objc func endAction() {
        handler?.endAction()
    }
    
    // MARK: - FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        wrongButton.layer.cornerRadius = 16
        hardButton.layer.cornerRadius = 16
        easyButton.layer.cornerRadius = 16
    }
    
    func setUpViews() {
        buttonsStack.addArrangedSubview(wrongButton)
        buttonsStack.addArrangedSubview(hardButton)
        buttonsStack.addArrangedSubview(easyButton)
        buttonsStack.isHidden = false
        addSubviews(labelStudy, cardView, buttonsStack)
        setUpConstraints()
    }

    func hideButtons() {
        UIView.transition(with: buttonsStack, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.buttonsStack.isHidden = true
        }, completion: nil)
    }

    func setPlaceHolders() {
        cardView.back.titleLabel.text = "..."
        cardView.back.pronunciationLabel.text = "/.../"
        cardView.front.titleLabel.text = "..."
        cardView.front.pronunciationLabel.text = "/.../"
    }

    func hideContent() {
        cardView.hideContent()
    }

    func showMessage() {
        labelStudy.text = String("\(Strings.STUDY.uppercased()): 0")
        cardView.showMessage()
    }

    func setTitles(with title: String, and numOfCards: Int) {
        cardView.back.titleLabel.text = title
        cardView.front.titleLabel.text = title
        labelStudy.text = String("\(Strings.STUDY.uppercased()): \(numOfCards)")
    }

    func loadImage(with url: String) {
        cardView.back.headerView.img.load(urlString: url)
    }

    func loadImage(with image: UIImage?) {
        cardView.back.headerView.img.image = image
    }

    func setPronunciation(with text: String) {
        cardView.back.pronunciationLabel.text = "/\(text)/"
        cardView.front.pronunciationLabel.text = "/\(text)/"
    }

    func enableButtons(_ value: Bool) {
        wrongButton.isEnabled = value
        hardButton.isEnabled  = value
        easyButton.isEnabled  = value
    }
}

// MARK: - CONSTRAINTS
extension ReviewView {
    func setUpConstraints() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            buttonsStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            buttonsStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStack.heightAnchor.constraint(equalToConstant: 50)
        ])

        labelStudy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStudy.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStudy.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5)
        ])

        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 15),
            cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            cardView.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -20)
        ])
    }
}
