//
//  WordListViewController.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {

    let wordView = WordView()
    let presenter: CardPresenter

    init(with presenter: CardPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
      view = wordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()

        wordView.totalLabel.text = "TOTAL: \(presenter.collection.cards!.count)"

        wordView.tableView.dataSource = self
        wordView.tableView.delegate   = self
        wordView.tableView.register(UINib.init(
            nibName: "WordTableViewCell",
            bundle: nil
        ),
        forCellReuseIdentifier: "WordCell")
    }

    func configureNavBar() {
        navigationItem.title = presenter.collection.name
        navigationItem.largeTitleDisplayMode = .never
    }

}

extension WordListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.collection.cards!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordTableViewCell
        if let cards = presenter.collection.cards {
            cell.configure(card: (cards.allObjects as! [Card])[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "") { (_, _, _) in
            if let cards = self.presenter.collection.cards {
                let alert = UIAlertController(
                    title: "Tem certeza que quer excluir \"\((self.presenter.collection.cards?.allObjects as! [Card])[indexPath.row].content!)\"?",
                    message: nil,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Excluir", style: .destructive, handler: { _ in
                    self.presenter.delete(card: (cards.allObjects as! [Card])[indexPath.row])
                    tableView.reloadData()
                }))

                self.present(alert, animated: true)
            }
            
        }

        //deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = .backgroundColor
        deleteAction.image?.withTintColor(.whiteColor)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
