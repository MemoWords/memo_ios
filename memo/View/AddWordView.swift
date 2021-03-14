//
//  AddWordView.swift
//  memo
//
//  Created by Elias Ferreira on 28/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddWordView: UIView {
    
    // MARK: - UIELEMENTS
    
    lazy var createLabel: UILabel = {
        let label = UILabel()
        label.text = "CRIAR UMA NOVA PASTA:"
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
        label.textColor = .memoText
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome da pasta"
        textField.font = UIFont(name: "SF Pro Text Medium", size: 18)
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
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 16)
        button.backgroundColor = .memoBlue
        button.setTitleColor(.memoWhite, for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        return button
    }()

    lazy var addFolderView: UIView = {
        let view = UIView()
        view.backgroundColor = .memoLightBackground
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = .init(width: 1, height: 3)
        return view
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OU"
        label.font = UIFont(name: "SF Pro Text Bold", size: 20)
        label.textColor = .memoText
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var selectLabel: UILabel = {
        let label = UILabel()
        label.text = "SELECIONE UMA PASTA:"
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
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
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ACTIONS
    
    // Save Button Action
    var addAction: (() -> Void)!
    @objc func add(sender: UIButton!) { addAction() }
    
    // MARK: - FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameTextField.layer.cornerRadius = 16
        addButton.layer.cornerRadius = 16
        addFolderView.layer.cornerRadius = 25
    }
    
    private func setupViews() {
        addFolderView.addSubviews(nameTextField, addButton)
        addSubviews(
            createLabel,
            addFolderView,
            orLabel,
            selectLabel,
            tableView
        )
        
        setupLabel()
        setUpAddFolderView()
        setupLabels()
        setupTableView()
    }
}
