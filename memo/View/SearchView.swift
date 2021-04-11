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
    lazy var searchTextFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .memoLightBackground
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.08
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = .init(width: 1, height: 3)
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView(image: UIImage(named: "lens.png"))
        textField.placeholder = "Pesquisar"
        textField.font = UIFont(name: "SF Pro Text Medium", size: 18)
        textField.textColor = .memoText
        textField.setRightPadding(12)
        textField.leftView = imageView
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.returnKeyType = .search
        textField.backgroundColor = .memoLightBackground
        textField.tintColor = .memoBlue
        textField.addTarget(self, action: #selector(search), for: .primaryActionTriggered)
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SALVAR", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 16)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        return button
    }()
    
    // Card
    let card = CardBackView()

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
    
    // Save Button Action
    var saveAction: (() -> Void)!
    @objc func save(sender: UIButton!) { saveAction() }
    
    // Search Button Action
    var searchAction: ((String) -> Void)!
    @objc func search(sender: UIButton!) {
        self.searchTextField.resignFirstResponder()
        searchAction(searchTextField.text!)
    }

    // MARK: - FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchTextField.layer.cornerRadius = 16
        saveButton.layer.cornerRadius = 16
    }
    
    private func setUpViews() {
        searchTextFieldView.addSubview(searchTextField)
        addSubviews(
            searchTextFieldView,
            card,
            saveButton
        )
        setupTextFieldView()
        setupTextField()
        setupButton()
        setupCard()
    }
    
    func activateButton(_ value: Bool) {
        if value {
            saveButton.backgroundColor = .memoBlue
            saveButton.setTitleColor(.memoWhite, for: .normal)
        } else {
            saveButton.backgroundColor = .memoTextBackground
            saveButton.setTitleColor(.memoGray, for: .normal)
        }
        saveButton.isEnabled = value
    }
}
