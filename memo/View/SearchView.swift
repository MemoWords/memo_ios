//
//  SearchView.swift
//  memo
//
//  Created by Elias Ferreira on 27/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    // MARK: - UIELEMENTS
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView(image: UIImage(named: "lens.png"))
        
        textField.placeholder = "Pesquisar"
        textField.font = UIFont(name: "SF Pro Text Medium", size: 18)
        textField.textColor = .memoBlack
        textField.layer.borderWidth = 1
        textField.setLeftPadding(12)
        textField.rightView = imageView
        textField.rightViewMode = .always
        textField.autocapitalizationType = .none
        textField.returnKeyType = .search
        textField.layer.borderColor = UIColor.memoDarkGray.cgColor
        textField.tintColor = .memoSecondBlue
        textField.addTarget(self, action: #selector(search), for: .primaryActionTriggered)
        
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("SALVAR", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 18)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        return button
    }()
    
    // Card
    let card = CardView()

    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .memoWhite
        self.setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ACTIONS
    
    // Save Button Action
    var saveAction: (() -> Void)!
    @objc func save(sender: UIButton!) { saveAction() }
    
    // Search Button Action
    var searchAction: ((String) -> Void)!
    @objc func search(sender: UIButton!) {
        searchAction(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
    // MARK: - FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchTextField.layer.cornerRadius = 8
        saveButton.layer.cornerRadius = 8
    }
    
    private func setUpViews() {
        self.addSubviews(
            searchTextField,
            card,
            saveButton
        )
        self.setupTextField()
        self.setupButton()
        self.setupCard()
    }
    
    func activateButton(_ value: Bool) {
        if value {
            self.saveButton.backgroundColor = .memoSecondBlue
            self.saveButton.setTitleColor(.memoWhite, for: .normal)
        } else {
            self.saveButton.backgroundColor = .memoLightGray
            self.saveButton.setTitleColor(.memoDarkGray, for: .normal)
        }
        self.saveButton.isEnabled = value
    }
}
