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
    
}

// MARK: - Extensions

// Table view population.
extension CollectionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows.
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell with data.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionsCell", for: indexPath) as! ColecoesTableViewCell
        
        return cell
    }
    
}
