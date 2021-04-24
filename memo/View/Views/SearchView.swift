//
//  SearchView.swift
//  memo
//
//  Created by Elias Ferreira on 27/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SearchView: UIView {

    // MARK: - PROPERTIES
    weak var handler: SearchViewHandleEvents?
    
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
        textField.font = .memoMedium(ofSize: .medium)
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
        button.titleLabel?.font = .memoMedium(ofSize: .normal)
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

    @objc func save(sender: UIButton!) {
        handler?.saveButtonTapped()
    }

    @objc func search(sender: UIButton!) {
        self.endEditing(true)
        handler?.searchButtonTapped(searchTextField.text!)
    }

    // MARK: - FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchTextField.layer.cornerRadius = 16
        saveButton.layer.cornerRadius = 16
    }
    
    private func setUpViews() {
        searchTextFieldView.addSubview(searchTextField)
        addSubviews(searchTextFieldView, card, saveButton)
        setUpConstraints()
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

    func setPronunciation(with pronunciation: String) {
        card.pronunciationLabel.text = "/\(pronunciation)/"
    }

    func setTitle(title: String) {
        card.titleLabel.text = title
    }

    func loadImage(with url: String) {
        card.headerView.img.load(urlString: url)
    }

    func loadImage(with image: UIImage?) {
        card.headerView.img.image = image
    }
}

// MARK: - CONSTRAINTS
extension SearchView {
    func setUpConstraints() {
        searchTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextFieldView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchTextFieldView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            searchTextFieldView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            searchTextFieldView.heightAnchor.constraint(equalToConstant: 50)
        ])

        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchTextFieldView.topAnchor, constant: 10),
            searchTextField.leftAnchor.constraint(equalTo: searchTextFieldView.leftAnchor),
            searchTextField.rightAnchor.constraint(equalTo: searchTextFieldView.rightAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchTextFieldView.bottomAnchor, constant: -10)
        ])

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: searchTextFieldView.bottomAnchor, constant: 20),
            card.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            card.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            card.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20)
        ])
    }
}
