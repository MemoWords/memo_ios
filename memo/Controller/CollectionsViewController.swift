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

    @IBOutlet weak var tableView: UITableView!
    
    let collectionRepository = CollectionRepository()
    var id: Int?
    var collections = [Collection]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.overrideUserInterfaceStyle = .light
        // Set this class as data source and delegate of the table view.
        tableView.dataSource = self
        tableView.delegate   = self
        // Register the xib file as a reusable cell of the table view.
        tableView.register(
            UINib.init(
                nibName: "ColecoesTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "CollectionsCell"
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collections = collectionRepository.fetchAll()
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        self.printAll() // Temporaly.
    }
    
    // MARK: - Funcs.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ReviewViewController {
            let vcon = segue.destination as? ReviewViewController
            vcon?.collection = self.collections[self.id!]
        }
    }
    
    func printAll() { // Temporaly function to see all the data.
        print("*-----------------------------------------------------*")
        for collection in collections {
            let cards = collection.cards?.allObjects as? [Card]
            print("* ", collection.name!)
            for card in cards! {
                print(" - \(card.content!) | \(card.nextStudyDay!) | \(card.lastDaysIncremented)")
            }
        }
        print("*-----------------------------------------------------*")
    }
    
}

// MARK: - Extension

// Table view population.
extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Sets the number of cells on tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.collections.count
    }
    
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CollectionsCell",
            for: indexPath
        ) as! ColecoesTableViewCell
        
        cell.selectionStyle = .none
        cell.configure(collection: self.collections[indexPath.row])
        
        return cell
    }

    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.id = indexPath.row
        self.performSegue(withIdentifier: "ReviewSegue", sender: self)
    }
    
}
