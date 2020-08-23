//
//  AddWordViewController.swift
//  memo
//
//  Created by Elias Ferreira on 18/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddWordViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let repository = CollectionRepository()
    weak var addWordDelegate: SaveWordDelegate?
    var wordToSave: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.overrideUserInterfaceStyle = .light
        self.title = "Salvar \(self.wordToSave!)"
        
// MARK: - TextField Style
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0).cgColor
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Nome da Coleção", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.30)])
// MARK: - Button Style
        self.addButton.layer.cornerRadius = 10
        
// MARK: - TableView Config
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib.init(nibName: "AddWordTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionNameCell")
        repository.reload()
    }
    
    @IBAction func calcelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if nameTextField.text != "" {
            addWordDelegate?.save(collectionId: nil, collectionName: nameTextField.text!, word: self.wordToSave!)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

// MARK: - Extensions

extension AddWordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionNameCell", for: indexPath) as! AddWordTableViewCell
        cell.selectionStyle = .none
        cell.configure(name: repository.collections[indexPath.row].name)
        
        return cell
    }
    
    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addWordDelegate?.save(collectionId: indexPath.row, collectionName: repository.collections[indexPath.row].name, word: self.wordToSave!)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
