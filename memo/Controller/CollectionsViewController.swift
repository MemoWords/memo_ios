//
//  CollectionsViewController.swift
//  memo
//
//  Created by Elias Ferreira on 17/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    
    // MARK: - Properties.

    let collectionsView = CollectionsView()
    let collectionRepository = CollectionRepository()
    
    var collections = [Collection]() {
        didSet {
            collectionsView.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavBar()

        collectionsView.messageCard.isHidden = true
        
        collectionsView.tableView.dataSource = self
        collectionsView.tableView.delegate   = self
        collectionsView.collectionView.dataSource = self
        collectionsView.collectionView.delegate   = self

        collectionsView.tableView.register(
            UINib.init(
                nibName: "FolderTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "FolderCell"
        )

        collectionsView.collectionView.register(
            UINib.init(
                nibName: "StudyCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "StudyCell"
        )

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collections = collectionRepository.fetchAll()
        collectionsView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    override func loadView() {
        super.loadView()
        self.view = collectionsView
    }
    
    // MARK: - Funcs.
    
    func configureNavBar() {
        self.navigationItem.title = TabBarItems.collections.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .primaryColor

        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Bold", size: 32)!,
            NSAttributedString.Key.foregroundColor: UIColor.titleColor
        ]
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Semibold", size: 16)!,
            NSAttributedString.Key.foregroundColor: UIColor.titleColor
        ]
    }
    
}

// MARK: - TableView

// Table view population.
extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Sets the number of cells on tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.collections.count
    }
    
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FolderCell",
            for: indexPath
        ) as! FolderTableViewCell
        
        cell.selectionStyle = .none
        cell.configure(collection: self.collections[indexPath.row])
        
        return cell
    }

    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let reviewViewController = ReviewViewController()
//        reviewViewController.collection = self.collections[indexPath.row]
//        self.navigationController?.pushViewController(reviewViewController, animated: true)
    }
    
}

// MARK: - CollectionView

extension CollectionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyCell", for: indexPath) as! StudyCollectionViewCell

        return cell
    }
}
