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
    let bugView = UIView()
    let messageCard = MessageCard()

    // MARK: - UI
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 223, height: 152)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset.left = 10
        layout.sectionInset.right = 10

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.alwaysBounceHorizontal = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    lazy var tableView: MemoTableView = {
        let table = MemoTableView(frame: .zero, style: .plain)
        table.rowHeight = 100
        return table
    }()

    lazy var labelStudy: UILabel = {
        let label = UILabel()
        label.text = "ESTUDAR"
        label.font = .memoMedium(ofSize: 16)
        label.textColor = .memoGray
        return label
    }()

    lazy var labelFolder: UILabel = {
        let label = UILabel()
        label.text = "PASTAS"
        label.font = .memoMedium(ofSize: 16)
        label.textColor = .memoGray
        return label
    }()

    lazy var addFolderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(nil, for: .normal)
        button.setImage(UIImage(named: "add_folder"), for: .normal)
        button.tintColor = .memoBlue
        return button
    }()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoBackground
        addSubviews(bugView, labelStudy, collectionView, messageCard, labelFolder, addFolderButton, tableView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

// MARK: - CONSTRAINTS

extension CollectionsView {
    func setUpConstraints() {
        labelStudy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStudy.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2),
            labelStudy.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            labelStudy.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 5),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 152)
        ])

        messageCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageCard.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 15),
            messageCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            messageCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            messageCard.heightAnchor.constraint(equalToConstant: 132)
        ])

        labelFolder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelFolder.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            labelFolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            labelFolder.trailingAnchor.constraint(equalTo: addFolderButton.trailingAnchor, constant: -20)
        ])

        addFolderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addFolderButton.centerYAnchor.constraint(equalTo: labelFolder.centerYAnchor),
            addFolderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            addFolderButton.widthAnchor.constraint(equalToConstant: 32),
            addFolderButton.heightAnchor.constraint(equalToConstant: 21)
        ])

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: labelFolder.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
