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
        title = collection?.name
        navigationItem.largeTitleDisplayMode = .never
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

}

extension WordListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordTableViewCell
        return cell
    }
}
