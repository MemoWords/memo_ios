//
//  ReviewView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ReviewView: UIView {
    
    // MARK: - UIELEMENTS
    
    // Labels
    lazy var labelStudy: UILabel = {
        let label = UILabel()
        label.text = "Estudar: 0"
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
        label.textColor = .memoGray
        return label
    }()
    
    // Buttons
    lazy var wrongButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NÃO SEI", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 16)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoRed
        button.addTarget(self, action: #selector(wrong), for: .touchUpInside)
        return button
    }()
    
    lazy var hardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DIFÍCIL", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 16)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoBlue
        button.addTarget(self, action: #selector(hard), for: .touchUpInside)
        return button
    }()
    
    lazy var easyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FÁCIL", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 16)
        button.setTitleColor(.memoWhite, for: .normal)
        button.backgroundColor = .memoGreen
        button.addTarget(self, action: #selector(easy), for: .touchUpInside)
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
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ACTIONS
    
    // Wrong Button Action
    var wrongAction: (() -> Void)!
    @objc func wrong(sender: UIButton!) { wrongAction() }
    
    // Hard Button Action
    var hardAction: (() -> Void)!
    @objc func hard(sender: UIButton!) { hardAction() }
    
    // Easy Button Action
    var easyAction: (() -> Void)!
    @objc func easy(sender: UIButton!) { easyAction() }
    
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
        
        addSubviews(
            labelStudy,
            cardView,
            buttonsStack
        )

        setUpLabel()
        setUpCard()
        setUpButtonsStack()
    }

    func hideButtons() {
        UIView.transition(with: buttonsStack, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.buttonsStack.isHidden = true
        }, completion: nil)
    }
}
