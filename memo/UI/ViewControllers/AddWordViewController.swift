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
            addWordView.tableView.reloadData()
        }
    }
    weak var addWordDelegate: SaveWordDelegate?
    var wordToSave: String?
    
    // MARK: - Lifecycle.
    
    override func loadView() {
        super.loadView()
        view = addWordView
        addWordView.handler = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        
        addWordView.tableView.dataSource   = self
        addWordView.tableView.delegate     = self
        addWordView.nameTextField.delegate = self
//
        addWordView.tableView.register(
            UINib.init(nibName: AddWordTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: AddWordTableViewCell.identifier
        )
        collections = collectionRepository.fetchAll()
        
    }
    
    // MARK: - FUNCTIONS
    
    private func configNavBar() {
        navigationItem.title = "\(Strings.SAVE) \"\(wordToSave!)\""
        navigationItem.largeTitleDisplayMode = .never
    }
    
}

// MARK: - Handling Events
extension AddWordViewController: AddWordViewHandleEvents {
    func dismissKeyboard() {
        view.endEditing(true)
    }

    func addButtonTapped() {
        if addWordView.nameTextField.text != "" {
            let name = addWordView.nameTextField.text!.replacingOccurrences(of: " ", with: "", options: .regularExpression, range: nil)
            if name == "" { return }
            cardRepository.create(collectionName: name, content: wordToSave!)
            navigationController?.popToRootViewController(animated: true)
            if let parentView = parent?.view {
                AlertHelper.showSuccessToast(view: parentView, message: Strings.TOAST_SAVED)
            }
        }
    }
}

// MARK: - Extensions

extension AddWordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddWordTableViewCell.identifier, for: indexPath) as! AddWordTableViewCell
        cell.selectionStyle = .none
        cell.configure(name: collections[indexPath.row].name!)
        
        return cell
    }
    
    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cardRepository.create(
            collection: collections[indexPath.row],
            content: wordToSave!
        )
        navigationController?.popToRootViewController(animated: true)
        if let parentView = parent?.view {
            AlertHelper.showSuccessToast(view: parentView, message: Strings.TOAST_SAVED)
        }
    }
}

// TextField Max Lenth
extension AddWordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 50
    }
}
