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
        searchView.handler = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        
        searchView.card.tableView.dataSource = self
        searchView.card.tableView.delegate   = self
        searchView.searchTextField.delegate  = self
        
        searchView.card.tableView.register(UINib.init(nibName: DefinitionTableViewCell.nibName, bundle: nil),
                                           forCellReuseIdentifier: DefinitionTableViewCell.identifier)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchView.searchTextField.text = ""
        showCard(false)
        searchView.activateButton(false)
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
            NSAttributedString.Key.font: UIFont.memoBold(ofSize: .large),
            NSAttributedString.Key.foregroundColor: UIColor.memoText
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.memoSemibold(ofSize: .mediumLarge),
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

    private func showCard(_ value: Bool) {
        searchView.card.isHidden = !value
        if value {
            searchView.card.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: false)
        }
    }
}

// MARK: - Handling Events
extension SearchViewController: SearchViewHandleEvents {
    func searchButtonTapped(_ word: String) {

        showCard(false)
        searchView.activateButton(false)
        searchView.setLoading(true)

        var wordToFind = word.replacingOccurrences(of: " ", with: "", options: .regularExpression, range: nil)
        wordToFind = wordToFind.trimmingCharacters(in: .punctuationCharacters)

        AnswerRepository.search(word: wordToFind) { response in
            DispatchQueue.main.async {

            if let answer = response.answer {
                    if let pronunciation = answer.pronunciation {
                        self.searchView.setPronunciation(with: pronunciation)
                    } else {
                        self.searchView.setPronunciation(with: "...")
                    }

                    self.searchView.setTitle(title: answer.word)
                    self.wordToSave = answer.word
                    self.definitions = answer.definitions

                    if let url = answer.definitions[0].image_url {
                        self.searchView.loadImage(with: url)
                    } else {
                        self.searchView.loadImage(with: UIImage(named: "photo"))
                    }

                    UIView.transition(with: self.searchView.card, duration: 0.2, options: .transitionCrossDissolve, animations: {
                        self.showCard(true)
                        // verificar se o card ja existe.
                        self.searchView.activateButton(
                            !self.cardRepository.exists(word: word)
                        )
                    }, completion: { _ in
                        // stop activity animation
                        self.searchView.setLoading(false)
                    })

                return
            }

            if let error = response.error {
                self.searchView.setLoading(false)
                switch error {
                case .notFound:
                        let alert = UIAlertController(title: "Desculpe!", message: error.description, preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true)
                default:
                    AlertHelper.showErrorToast(view: self.view, message: error.description)
                }
                return
            }
        }
        }

    }

    func saveButtonTapped() {
        let addWordController = AddWordViewController()
        addWordController.wordToSave = wordToSave!
        navigationController?.pushViewController(addWordController, animated: true)
    }
}

// MARK: - Extensions.

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(withIdentifier: DefinitionTableViewCell.identifier, for: indexPath) as! DefinitionTableViewCell
        
        cell.configure(definition: definitions[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension SearchViewController: SaveWordDelegate {
    func save(collection: Collection?, collectionName: String?, word: String) {
        
    }
}

// TextField Max Lenth
extension SearchViewController: UITextFieldDelegate {
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
