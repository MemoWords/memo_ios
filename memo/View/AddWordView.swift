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
        label.text = "Criar uma nova coleção:"
        label.font = UIFont(name: "SF Pro Text Bold", size: 18)
        label.textColor = .memoBlack
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Nome da coleção"
        textField.font = UIFont(name: "SF Pro Text Medium", size: 18)
        textField.textColor = .memoBlack
        textField.layer.borderWidth = 1
        textField.setLeftPadding(12)
        textField.setRightPadding(12)
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        textField.layer.borderColor = UIColor.memoDarkGray.cgColor
        textField.tintColor = .memoSecondBlue
        
        return textField
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("ADICIONAR", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Medium", size: 18)
        button.backgroundColor = .memoSecondBlue
        button.setTitleColor(.memoWhite, for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OU"
        label.font = UIFont(name: "SF Pro Text Bold", size: 18)
        label.textColor = .memoBlack
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var selectLabel: UILabel = {
        let label = UILabel()
        label.text = "Selecione uma coleção:"
        label.font = UIFont(name: "SF Pro Text Bold", size: 18)
        label.textColor = .memoBlack
        return label
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.alwaysBounceVertical = true
        table.tableHeaderView = .none
        table.alwaysBounceHorizontal = false
        table.separatorInset = .zero
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.rowHeight = 93
        return table
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoWhite
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
        nameTextField.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
    }
    
    private func setupViews() {
        addSubviews(
            createLabel,
            nameTextField,
            addButton,
            orLabel,
            selectLabel,
            tableView
        )
        
        setupLabel()
        setupTextField()
        setupAddButton()
        setupLabels()
        setupTableView()
    }
}
