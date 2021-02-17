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
	var presenter: CollectionsPresenter
	
    // MARK: - Lifecycle.

	init(with presenter: CollectionsPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        collectionsView.messageCard.isHidden = true

        collectionsView.addFolderButton.addTarget(self, action: #selector(addFolder), for: .touchUpInside)

        presenter.delegate = self
        collectionsView.tableView.dataSource = self
        collectionsView.tableView.delegate   = self
        collectionsView.collectionView.dataSource = self
        collectionsView.collectionView.delegate   = self

        collectionsView.collectionView.register(
            UINib.init(nibName: "StudyCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "StudyCell"
        )

        collectionsView.tableView.register(
            UINib.init(nibName: "FolderTableViewCell", bundle: nil),
            forCellReuseIdentifier: "FolderCell"
        )

    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.updateData()
        collectionsView.tableView.scrollToRow(
            at: IndexPath(row: 0, section: 0),
            at: .top,
            animated: false
        )
        collectionsView.collectionView.scrollToItem(
            at: IndexPath(row: 0, section: 0),
            at: .centeredHorizontally,
            animated: false
        )

    }
    
    override func loadView() {
        super.loadView()
        view = collectionsView
    }
    
    // MARK: - Actions.

    @objc func addFolder() {
        let alert = UIAlertController(title: "Nome da nova pasta:", message: nil, preferredStyle: .alert)
        alert.overrideUserInterfaceStyle = .light
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))

        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Name:"
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            if let name = alert.textFields?.first?.text {
                self.presenter.add(name: name)
                self.collectionsView.tableView.reloadData()
                self.presenter.updateData()
            }
        }))

        self.present(alert, animated: true)
    }

    // MARK: - Funcs.

    func configureNavBar() {
        navigationItem.title = TabBarItems.collections.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .primaryColor

        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Bold", size: 32)!,
            NSAttributedString.Key.foregroundColor: UIColor.titleColor
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Semibold", size: 17)!,
            NSAttributedString.Key.foregroundColor: UIColor.titleColor
        ]

        let image = UIImage(systemName: "arrow.left")
        let backButton = UIBarButtonItem()
        backButton.title = ""
        // Set the back button.
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
}

// MARK: - Presenter protocol.

extension CollectionsViewController: CollectionPresenterDelegate {
    func reloadData(value: Bool) {
        collectionsView.collectionView.reloadData()
        collectionsView.tableView.reloadData()
        collectionsView.collectionView.isHidden = !value
        collectionsView.messageCard.isHidden = value
    }
}

// MARK: - CollectionView

extension CollectionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.collectionsToStudy.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudyCell", for: indexPath) as! StudyCollectionViewCell

        cell.configure(collection: presenter.collectionsToStudy[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let reviewViewController = ReviewViewController()
        reviewViewController.collection = presenter.collectionsToStudy[indexPath.row]
        self.navigationController?.pushViewController(reviewViewController, animated: true)
    }

}

// MARK: - TableView

extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Sets the number of cells on tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.collections.count
    }
    
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FolderCell",
            for: indexPath
        ) as! FolderTableViewCell
        
        cell.selectionStyle = .none
        cell.configure(collection: presenter.collections[indexPath.row])
        
        return cell
    }

    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardPresenter = CardPresenter(collection: presenter.collections[indexPath.row])
        let wordListController = WordListViewController(with: cardPresenter)
        navigationController?.pushViewController(wordListController, animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { (_, _, _) in
            if self.presenter.collections[indexPath.row].cards?.count != 0 {
                let alert = UIAlertController(
                    title: "A pasta \(String(describing: self.presenter.collections[indexPath.row].name!)) não está vazia, tem certeza que quer excluí-la?",
                    message: nil,
                    preferredStyle: .alert
                )
                alert.overrideUserInterfaceStyle = .light
                alert.addAction(UIAlertAction(title: "Não", style: .destructive, handler: nil))

                alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { _ in
                    self.presenter.delete(at: indexPath.row)
                }))

                self.present(alert, animated: true)
            } else {
                self.presenter.delete(at: indexPath.row)
            }

        }
        //deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = .backgroundColor
        deleteAction.image?.withTintColor(.whiteColor)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
