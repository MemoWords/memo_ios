//
//  AddWordViewController.swift
//  memo
//
//  Created by Elias Ferreira on 18/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController {
    
    // MARK: - Properties.
    let addWordView = AddWordView()// VIEW
    
    let collectionRepository = CollectionRepository()
    let cardRepository = CardRepository()
    var collections = [Collection]() {
        didSet {
            self.addWordView.tableView.reloadData()
        }
    }
    weak var addWordDelegate: SaveWordDelegate?
    var wordToSave: String?
    
    // MARK: - Lifecycle.
    
    override func loadView() {
        super.loadView()
        self.view = self.addWordView
        self.addWordView.addAction = self.addButtonTapped
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavBar()
        
        addWordView.tableView.dataSource = self
        addWordView.tableView.delegate = self
//
        addWordView.tableView.register(UINib.init(nibName: "AddWordTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionNameCell")
        self.collections = collectionRepository.fetchAll()
        
        addWordView.nameTextField.addTarget(self, action: #selector(dismissKeyboard), for: .primaryActionTriggered)
        
    }
    
    // MARK: - Actions.
    
    @IBAction func calcelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func addButtonTapped() {
        if addWordView.nameTextField.text != "" {
            self.cardRepository.create(collectionName: addWordView.nameTextField.text!, content: self.wordToSave!)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    // MARK: - FUNCTIONS
    
    private func configNavBar() {
        self.title = "Salvar \(self.wordToSave!)"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
}

// MARK: - Extensions

extension AddWordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionNameCell", for: indexPath) as! AddWordTableViewCell
        cell.selectionStyle = .none
        cell.configure(name: self.collections[indexPath.row].name!)
        
        return cell
    }
    
    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cardRepository.create(
            collection: self.collections[indexPath.row],
            content: self.wordToSave!
        )
        self.navigationController?.popToRootViewController(animated: true)
    }
}
