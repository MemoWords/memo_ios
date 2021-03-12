//
//  ReviewViewController.swift
//  memo
//
//  Created by Elias Ferreira on 17/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    // MARK: - Properties.
    let reviewView = ReviewView() // VIEW
    
    let cardRepository = CardRepository()
    var cards = [Card]()
    var collection: Collection?
    var count = 0
    var numOfCardsToStudy = 0
    
    var definitions = [Definition]() {
        didSet {
            reviewView.card.tableView.reloadData()
        }
    }
    
    var isContentHidden: Bool? {
        didSet {
            reviewView.card.img.isHidden = isContentHidden!
            reviewView.card.tableView.isHidden = isContentHidden!
            reviewView.card.showAnswerButton.isHidden = !isContentHidden!
        }
    }
    
    // MARK: - Lifecycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        
        reviewView.card.tableView.dataSource = self
        reviewView.card.tableView.delegate  = self

        reviewView.card.tableView.register(
            UINib.init(nibName: "DefinitionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DefinitionCell"
        )
        
        if let cards = collection?.cards {
            self.cards = cards.allObjects as! [Card]
        }
        
        numOfCardsToStudy = getNumOfCardsToStudy()
        
        show()
    }
    
    override func loadView() {
        super.loadView()
        view = reviewView
        reviewView.wrongAction = wrongButtonTapped
        reviewView.hardAction = hardButtonTapped
        reviewView.easyAction = easyButtonTapped
        reviewView.card.showAction = showButtonTapped
    }

    // MARK: - Actions.
    
    func showButtonTapped() {
        reviewView.card.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        isContentHidden = false
    }
    
    func wrongButtonTapped() {
        update(val: 0)
        count += 1
        show()
    }
    
    func hardButtonTapped() {
        numOfCardsToStudy -= 1
        update(val: 1)
        count += 1
        show()
    }
    
    func easyButtonTapped() {
        numOfCardsToStudy -= 1
        update(val: 2)
        count += 1
        show()
    }
    
    // MARK: - Functions.
    func configNavBar() {
        navigationItem.title = collection?.name
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func show() {
        isContentHidden = true
        showMessage(false)
        
        reviewView.labelTotal.text = String("Total: \(cards.count)")
        reviewView.labelStudy.text = String("Estudar: \(numOfCardsToStudy)")
        reviewView.card.titleLabel.text = "..."
        reviewView.card.pronunciationLabel.text = "/.../"
        
        if self.count >= cards.count {
            if numOfCardsToStudy == 0 {
                showMessage(true)
            } else {
                count = 0
                show()
            }
        } else {
            if DateHelper.isToday(dateString: cards[count].nextStudyDay!) {
                let title = cards[count].content!
                setAnswerData(word: title)
            } else {
                count += 1
                show()
            }
        }
    }
    
    func setAnswerData(word: String) {
        AnswerRepository.search(word: word) { answer in
            DispatchQueue.main.async {
                self.reviewView.card.titleLabel.text = word
                if let pronunciation = answer.pronunciation {
                    self.reviewView.card.pronunciationLabel.text = "/\(pronunciation)/"
                } else {
                    self.reviewView.card.pronunciationLabel.text = "/.../"
                }
                self.definitions = answer.definitions
            }
        }
    }
    
    func showMessage(_ value: Bool) {
        reviewView.card.isHidden = value
        reviewView.buttonsStack.isHidden = value
        reviewView.cardMessage.isHidden = !value
    }
    
    func getNumOfCardsToStudy() -> Int {
        var num = 0
        for card in cards {
            if DateHelper.isToday(dateString: card.nextStudyDay!) {
                num += 1
            }
        }
        return num
    }
    
    func update(val: Int) {
        let algorithmData = Classification.classificate(val: val, lastDayIncremented: Int(cards[count].lastDaysIncremented))

        if algorithmData.days != 0 { // veririca se há valores a serem atualizados
            // Atualiza os valores no card.
            cards[count].nextStudyDay = DateHelper.incrementDate(
                data: cards[count].nextStudyDay!,
                val: algorithmData.days
            )
            cards[count].lastDaysIncremented = Int64(algorithmData.lastIncrement)
        }
        // Solicita o salvamento da lista de cards no arquivo.
        cardRepository.save()
    }
    
}

// MARK: - Extensions

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    // Number of cells.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitions.count
    }
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        cell.configure(definition: definitions[indexPath.row])
        
        return cell
    }
}
