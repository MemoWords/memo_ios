//
//  SearchViewController.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, SaveWordDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPronunciation: UILabel!
    
    var definitions = [Definition]()
    let cardRepository = CardRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //Put a Search Image at the Search Text Fiel.
//        let imageView = UIImageView()
//        let image = UIImage(systemName: "magnifyingglass")
//        imageView.tintColor = UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0)
//        imageView.image = image;
//        searchTextField.rightView = imageView
//        searchTextField.rightViewMode = .always
        
        // search field style.
        searchTextField.layer.cornerRadius = 10
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0).cgColor
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.30)])
        // -------- Card Style ----------
        // Radius.
        card.layer.cornerRadius = 8
        // Border.
        card.layer.borderWidth = 0.5
        card.layer.borderColor = UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0).cgColor
        // Shadow.
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.1
        card.layer.shadowRadius = 6
        card.layer.shadowOffset = .init(width: 0, height: 3)
        // -------- Card Style ----------
        saveButton.layer.cornerRadius = 10
        // -------- Image Style ---------
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        // Datasource and delegate.
        tableView.dataSource = self
        tableView.delegate   = self
        
        // Register the xib as a cell.
        tableView.register(UINib.init(nibName: "DefinitionTableViewCell", bundle: nil), forCellReuseIdentifier: "DefinitionCell")
        
        searchTextField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.card.isHidden = true
        self.searchTextField.text = ""
    }
    
    @IBAction func searchAction(_ sender: Any) {
        AnswerRepository.search(
        word: self.searchTextField.text!,
        completion: { (answer) in
            DispatchQueue.main.async {
                self.view.endEditing(true)
                self.card.isHidden = false
                if let pronunciation = answer.pronunciation {
                    self.labelPronunciation.text = "/\(pronunciation)/"
                } else {
                    self.labelPronunciation.text = "/.../"
                }
                self.labelTitle.text = answer.word
                self.definitions = answer.definitions
                self.tableView.reloadData()
                
                // verificar se o card ja existe.
                if self.cardRepository.exists(word: answer.word) {
                    self.deactivateButtonSave()
                } else {
                    self.acticateButtonSave()
                }
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddWordViewController {
            let vc = segue.destination as? AddWordViewController
            vc?.addWordDelegate = self
            vc?.wordToSave = self.searchTextField.text
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "addWordSegue", sender: self)
    }
    
    func save(collection: Collection?, collectionName: String?, word: String) {
        if let col = collection {
            self.cardRepository.create(collection: col, content: word)
        } else {
            self.cardRepository.create(collectionName: collectionName!, content: word)
        }
    }
    
    func acticateButtonSave() {
        self.saveButton.layer.backgroundColor = UIColor(red: 54/255, green: 101/255, blue: 227/255, alpha: 1.0).cgColor
        self.saveButton.setTitleColor(UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1.0), for: .normal)
        self.saveButton.isEnabled = true
    }
    
    func deactivateButtonSave() {
        self.saveButton.layer.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 245/255, alpha: 1.0).cgColor
        self.saveButton.setTitleColor(UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0), for: .disabled)
        self.saveButton.isEnabled = false
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
