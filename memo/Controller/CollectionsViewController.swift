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
        
        collectionsView.tableView.dataSource = self
        collectionsView.tableView.delegate   = self
        
        collectionsView.tableView.register(
            UINib.init(
                nibName: "ColecoesTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "CollectionsCell"
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
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.tintColor = .memoSecondBlue
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.memoBlack
        ]
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.memoBlack
        ]
    }
    
}

// MARK: - Extension

// Table view population.
extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Sets the number of cells on tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.collections.count
    }
    
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CollectionsCell",
            for: indexPath
        ) as! ColecoesTableViewCell
        
        cell.selectionStyle = .none
        cell.configure(collection: self.collections[indexPath.row])
        
        return cell
    }

    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reviewViewController = ReviewViewController()
        reviewViewController.collection = self.collections[indexPath.row]
        self.navigationController?.pushViewController(reviewViewController, animated: true)
    }
    
}
