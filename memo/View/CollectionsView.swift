//
//  CollectionsView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CollectionsView: UIView {
    
    // MARK: - PROPERTIES
    let tableView = CollectionsTableView(frame: .zero, style: .plain)
    var collectionView: StudyCollectionView
    let bugView = UIView()
    let messageCard = MessageCard()

    lazy var labelStudy: UILabel = {
        let label = UILabel()
        label.text = "STUDAR"
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
        label.textColor = .bodyColor
        return label
    }()

    lazy var labelFolder: UILabel = {
        let label = UILabel()
        label.text = "PASTAS"
        label.font = UIFont(name: "SF Pro Text Medium", size: 16)
        label.textColor = .bodyColor
        return label
    }()

    lazy var addFolderButton: UIButton = {
        let button = UIButton()
        button.setTitle(nil, for: .normal)
        button.setImage(UIImage(systemName: "folder.fill.badge.plus"), for: .normal)
        button.tintColor = .primaryColor
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        return button
    }()

    @objc func add() {
        collectionView.isHidden = !collectionView.isHidden
        messageCard.isHidden = !messageCard.isHidden
    }
    
    // MARK: - INIT
    override init(frame: CGRect) {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 223, height: 152)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset.left = 12
        layout.sectionInset.right = 12

        self.collectionView = StudyCollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(frame: frame)

        self.backgroundColor = .backgroundColor
        self.addSubviews(bugView, labelStudy, collectionView, messageCard, labelFolder, addFolderButton, tableView)
        self.setUpLabelStudy()
        self.setUpCollectionView()
        self.setUpLabelFolder()
        self.setUpMessageCard()
        self.setUpButton()
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

// MARK: - CONSTRAINTS

extension CollectionsView {
    func setUpLabelStudy() {
        labelStudy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStudy.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            labelStudy.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            labelStudy.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22)
        ])
    }

    func setUpCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 152)
        ])
    }

    func setUpMessageCard() {
        messageCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageCard.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 20),
            messageCard.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50),
            messageCard.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50),
            messageCard.heightAnchor.constraint(equalToConstant: 132)
        ])
    }

    func setUpLabelFolder() {
        labelFolder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelFolder.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            labelFolder.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            labelFolder.trailingAnchor.constraint(equalTo: addFolderButton.trailingAnchor, constant: -20)
        ])
    }

    func setUpButton() {
        addFolderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addFolderButton.centerYAnchor.constraint(equalTo: labelFolder.centerYAnchor),
            addFolderButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            addFolderButton.widthAnchor.constraint(equalToConstant: 32),
            addFolderButton.heightAnchor.constraint(equalToConstant: 19)
        ])
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: labelFolder.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
