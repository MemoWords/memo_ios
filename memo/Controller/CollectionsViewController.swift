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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this class as data source and delegate of the table view.
        tableView.dataSource = self
        tableView.delegate   = self
        
        // Register the xib file as a reusable cell of the table view.
        tableView.register(UINib.init(nibName: "ColecoesTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionsCell")
        
    }
    
    // Add Collection button pressed.
    @IBAction func AddCollectionTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "AddCollectionSegue", sender: self)
    }
    
}

// MARK: - Extensions

// Table view population.
extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows.
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionsCell", for: indexPath) as! ColecoesTableViewCell
        
        //remove the style of the selection.
        cell.selectionStyle = .none
        
        return cell
    }
    
    // When a cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ReviewSegue", sender: self)
        print("row: \(indexPath.row)")
    }
}
