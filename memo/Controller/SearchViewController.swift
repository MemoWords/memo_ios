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
    
    var definitions = [Definition]()
    let cardRepository = CardRepository()
    var wordToSave: String?
    
    // MARK: - Lifecycle.
    
    override func loadView() {
        super.loadView()
        self.view = self.searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar()
        // Datasource and delegate.
//        tableView.dataSource = self
//        tableView.delegate   = self
        
        // Register the xib as a cell.
//        tableView.register(UINib.init(nibName: "DefinitionTableViewCell", bundle: nil), forCellReuseIdentifier: "DefinitionCell")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.card.isHidden = true
//        self.searchTextField.text = ""
    }
    
    // MARK: - Actions.
    
    @IBAction func searchAction(_ sender: Any) {
//        AnswerRepository.search(
//        word: self.searchTextField.text!,
//        completion: { (answer) in
//            DispatchQueue.main.async {
//                self.view.endEditing(true)
//                self.card.isHidden = false
//                if let pronunciation = answer.pronunciation {
//                    self.labelPronunciation.text = "/\(pronunciation)/"
//                } else {
//                    self.labelPronunciation.text = "/.../"
//                }
//                self.labelTitle.text = answer.word
//                self.wordToSave = answer.word
//                self.definitions = answer.definitions
//                self.tableView.reloadData()
//
//                // verificar se o card ja existe.
//                if self.cardRepository.exists(word: answer.word) {
//                    self.deactivateButtonSave()
//                } else {
//                    self.acticateButtonSave()
//                }
//            }
//        })
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
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
    
    func acticateButtonSave() {
//        self.saveButton.layer.backgroundColor = UIColor(red: 54/255, green: 101/255, blue: 227/255, alpha: 1.0).cgColor
//        self.saveButton.setTitleColor(UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1.0), for: .normal)
//        self.saveButton.isEnabled = true
    }
    
    func deactivateButtonSave() {
//        self.saveButton.layer.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 245/255, alpha: 1.0).cgColor
//        self.saveButton.setTitleColor(UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0), for: .disabled)
//        self.saveButton.isEnabled = false
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
