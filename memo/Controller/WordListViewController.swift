//
//  WordListViewController.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {
    
    var collection: Collection?
    let wordView = WordView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = wordView
        configureNavBar()
        wordView.totalLabel.text = "TOTAL: \(collection!.cards!.count)"

        wordView.tableView.dataSource = self
        wordView.tableView.delegate   = self

        wordView.tableView.register(UINib.init(
            nibName: "WordTableViewCell",
            bundle: nil
        ),
        forCellReuseIdentifier: "WordCell")
    }

    func configureNavBar() {
        navigationItem.title = collection?.name
        navigationItem.largeTitleDisplayMode = .never
    }

}

extension WordListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collection!.cards!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordTableViewCell
        if let cards = collection!.cards {
            cell.configure(card: (cards.allObjects as! [Card])[indexPath.row])
        }
        return cell
    }
}
