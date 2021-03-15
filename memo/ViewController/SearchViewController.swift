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
            searchView.card.tableView.reloadData()
        }
    }
    let cardRepository = CardRepository()
    var wordToSave: String?
    
    // MARK: - Lifecycle.
    
    override func loadView() {
        super.loadView()
        view = searchView
        searchView.saveAction = saveButtonTapped
        searchView.searchAction = searchButtonTapped
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        
        searchView.card.tableView.dataSource = self
        searchView.card.tableView.delegate   = self
        
        searchView.card.tableView.register(UINib.init(nibName: "DefinitionTableViewCell", bundle: nil), forCellReuseIdentifier: "DefinitionCell")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchView.searchTextField.text = ""
        searchView.card.isHidden = true
        searchView.activateButton(false)
    }
    
    // MARK: - Actions.
    
    func searchButtonTapped(_ word: String) {
        
        AnswerRepository.search(word: word) { answer in
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

                if let img = answer.definitions[0].image_url {
                    self.searchView.card.img.load(urlString: img)
                } else {
                    self.searchView.card.img.image = UIImage(named: "photo")
                }

                // verificar se o card ja existe.
                self.searchView.activateButton(
                    !self.cardRepository.exists(word: word)
                )
                
            }
        }
        
    }
    
    // MARK: - ACTIONS
    
    func saveButtonTapped() {
        let addWordController = AddWordViewController()
        addWordController.wordToSave = wordToSave!
        navigationController?.pushViewController(addWordController, animated: true)
    }
    
    // MARK: - Functions.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setUpNavBar() {
        navigationItem.title = TabBarItems.search.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .memoBlue
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Bold", size: 30)!,
            NSAttributedString.Key.foregroundColor: UIColor.memoText
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SF Pro Text Semibold", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.memoText
        ]
        let image = UIImage(named: "back_button")
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

// MARK: - Extensions.

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        cell.configure(definition: definitions[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension SearchViewController: SaveWordDelegate {
    func save(collection: Collection?, collectionName: String?, word: String) {
        
    }
}
