//
//  CollectionsViewController.swift
//  memo
//
//  Created by Elias Ferreira on 17/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let repository = CollectionRepository()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this class as data source and delegate of the table view.
        tableView.dataSource = self
        tableView.delegate   = self
        
        // Register the xib file as a reusable cell of the table view.
        tableView.register(UINib.init(nibName: "ColecoesTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionsCell")
        
        //-----Fill Some--------
        repository.clear()
        
        let coll1 = Collection(
            name: "Substantivos",
            cards: []
        )
        let coll2 = Collection(
            name: "Verbos",
            cards: [
                Card(content: "love"),
                Card(content: "fall"),
                Card(content: "gain")
            ]
        )
        let coll3 = Collection(
            name: "Preposições",
            cards: [
                Card(content: "here"),
                Card(content: "there"),
                Card(content: "in"),
                Card(content: "out")
            ]
        )
        
        repository.create(collection: coll1)
        repository.create(collection: coll2)
        repository.create(collection: coll3)
        //-----End--------------*/
        
        /* test API
        
        AnswerRepository.search(word: "car", completion: { (answer) in
            DispatchQueue.main.async {
                print(answer.definitions[0].definition)
            }
        })
        //-----*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        repository.reload()
        tableView.reloadData()
    }
    
}

// MARK: - Extensions

// Table view population.
extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows.
        repository.collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionsCell", for: indexPath) as! ColecoesTableViewCell
        
        cell.selectionStyle = .none
        cell.configure(collection: repository.collections[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ReviewViewController {
            let vc = segue.destination as? ReviewViewController
            vc?.index = self.id
        }
    }
    
    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.id = indexPath.row
        self.performSegue(withIdentifier: "ReviewSegue", sender: self)
        print("row: \(indexPath.row)")
    }
    
}
