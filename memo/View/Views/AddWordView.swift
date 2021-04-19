//
//  AddWordView.swift
//  memo
//
//  Created by Elias Ferreira on 28/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddWordView: UIView {

    weak var delegate: AddWordViewEventsDelegate?
    
    // MARK: - UIELEMENTS
    
    lazy var createLabel: UILabel = {
        let label = UILabel()
        label.text = "CRIAR UMA NOVA PASTA:"
        label.font = .memoMedium(ofSize: 16)
        label.textColor = .memoText
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome da pasta"
        textField.font = .memoMedium(ofSize: 18)
        textField.backgroundColor = .memoTextBackground
        textField.textColor = .memoText
        textField.setLeftPadding(12)
        textField.setRightPadding(12)
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        textField.tintColor = .memoBlue
        return textField
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ADICIONAR", for: .normal)
        button.titleLabel?.font = .memoMedium(ofSize: 16)
        button.backgroundColor = .memoBlue
        button.setTitleColor(.memoWhite, for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        return button
    }()

    lazy var addFolderView: UIView = {
        let view = UIView()
        view.backgroundColor = .memoLightBackground
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.08
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = .init(width: 1, height: 3)
        return view
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OU"
        label.font = .memoBold(ofSize: 20)
        label.textColor = .memoText
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var selectLabel: UILabel = {
        let label = UILabel()
        label.text = "SELECIONE UMA PASTA:"
        label.font = .memoMedium(ofSize: 16)
        label.textColor = .memoText
        return label
    }()

    lazy var tableView: MemoTableView = {
        let table = MemoTableView()
        table.showsVerticalScrollIndicator = false
        table.rowHeight = 86
        return table
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoBackground
        nameTextField.addTarget(self, action: #selector(dismissKeyboard), for: .primaryActionTriggered)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ACTIONS

    @objc func dismissKeyboard() {
        delegate?.dismissKeyboard()
    }

    @objc func add(sender: UIButton!) {
        delegate?.addButtonTapped()
    }
    
    // MARK: - FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameTextField.layer.cornerRadius = 16
        addButton.layer.cornerRadius = 16
        addFolderView.layer.cornerRadius = 25
    }
    
    private func setupViews() {
        addFolderView.addSubviews(nameTextField, addButton)
        addSubviews(createLabel, addFolderView, orLabel, selectLabel, tableView)
        setuUpConstraints()
    }
}

// MARK: - CONSTRAINTS
extension AddWordView {
    func setuUpConstraints() {
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            createLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            createLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)
        ])

        addFolderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addFolderView.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 16),
            addFolderView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            addFolderView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: addFolderView.topAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: addFolderView.leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: addFolderView.rightAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            addButton.leftAnchor.constraint(equalTo: addFolderView.leftAnchor, constant: 20),
            addButton.rightAnchor.constraint(equalTo: addFolderView.rightAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: addFolderView.bottomAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        orLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: addFolderView.bottomAnchor, constant: 25),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectLabel.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            selectLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            selectLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25)
        ])

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
