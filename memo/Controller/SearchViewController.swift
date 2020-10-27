//
//  SearchViewController.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties.
    
    let searchView = SearchView() // VIEW
    
    var definitions = [Definition]() {
        didSet {
            self.searchView.card.tableView.reloadData()
        }
    }
    let cardRepository = CardRepository()
    var wordToSave: String?
    
    // MARK: - Lifecycle.
    
    override func loadView() {
        super.loadView()
        self.view = self.searchView
        self.searchView.saveAction = self.saveButtonTapped
        self.searchView.searchAction = self.searchButtonTapped
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar()
        
        searchView.card.tableView.dataSource = self
        searchView.card.tableView.delegate   = self
        
        searchView.card.tableView.register(UINib.init(nibName: "DefinitionTableViewCell", bundle: nil), forCellReuseIdentifier: "DefinitionCell")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchView.searchTextField.text = ""
        searchView.card.isHidden = true
        searchView.activateButton(false)
    }
    
    // MARK: - Actions.
    
    func searchButtonTapped(_ word: String) {
        
        AnswerRepository.search(
        word: word,
        completion: { (answer) in
            DispatchQueue.main.async {
                
                self.searchView.card.isHidden = false
                
                if let pronunciation = answer.pronunciation {
                    self.searchView.card.pronunciationLabel.text = "/\(pronunciation)/"
                } else {
                    self.searchView.card.pronunciationLabel.text = "/.../"
                }
                
                self.searchView.card.titleLabel.text = answer.word
                self.wordToSave = answer.word
                self.definitions = answer.definitions
                
                // verificar se o card ja existe.
                self.searchView.activateButton(
                    !self.cardRepository.exists(word: word)
                )
                
            }
        })
        
    }
    
    func saveButtonTapped() {
        print("Saving...")
        //self.performSegue(withIdentifier: "addWordSegue", sender: self)
    }
    
    // MARK: - Functions.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setUpNavBar() {
        self.navigationItem.title = TabBarItems.search.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = .memoSecondBlue
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Bold", size: 34)!,
            NSAttributedString.Key.foregroundColor: UIColor.memoBlack
        ]
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Semibold", size: 17)!,
            NSAttributedString.Key.foregroundColor: UIColor.memoBlack
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is AddWordViewController {
//            let vc = segue.destination as? AddWordViewController
//            vc?.addWordDelegate = self
//            vc?.wordToSave = self.wordToSave!
//        }
    }
    
}

// MARK: - Extensions.

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.definitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        cell.configure(definition: self.definitions[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension SearchViewController: SaveWordDelegate {
    func save(collection: Collection?, collectionName: String?, word: String) {
        if let col = collection {
            self.cardRepository.create(collection: col, content: word)
        } else {
            self.cardRepository.create(collectionName: collectionName!, content: word)
        }
    }
}
