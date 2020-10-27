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
    let reviewView = ReviewView()
    
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
        self.configNavBar()
        
        reviewView.card.tableView.dataSource = self
        reviewView.card.tableView.delegate  = self

        reviewView.card.tableView.register(
            UINib.init(
                nibName: "DefinitionTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "DefinitionCell"
        )
        
        if let cards = self.collection?.cards {
            self.cards = cards.allObjects as! [Card]
        }
        
        self.numOfCardsToStudy = self.getNumOfCardsToStudy()
        
        self.show()
    }
    
    override func loadView() {
        super.loadView()
        self.view = reviewView
        reviewView.wrongAction = self.wrongButtonTapped
        reviewView.hardAction = self.hardButtonTapped
        reviewView.easyAction = self.easyButtonTapped
        reviewView.card.showAction = self.showButtonTapped
    }

    // MARK: - Actions.
    
    func showButtonTapped() {
        reviewView.card.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        self.isContentHidden = false
    }
    
    func wrongButtonTapped() {
//        self.update(val: 0)
//        self.count += 1
//        self.show()
        
        print("Não Sei")
    }
    
    func hardButtonTapped() {
//        self.numOfCardsToStudy -= 1
//        self.update(val: 1)
//        self.count += 1
//        //self.showButtonShowAnswer(value: true)
//        self.show()
        print("Difícil")
    }
    
    func easyButtonTapped() {
//        self.numOfCardsToStudy -= 1
//        self.update(val: 2)
//        self.count += 1
//        //self.showButtonShowAnswer(value: true)
//        self.show()
        print("Fácil")
    }
    
    // MARK: - Functions.
    func configNavBar() {
        self.title = self.collection?.name
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func show() {
        self.isContentHidden = true
        self.showMessage(false)
        
        reviewView.labelTotal.text = String("Total: \(self.cards.count)")
        reviewView.labelStudy.text = String("Estudar: \(self.numOfCardsToStudy)")
        reviewView.card.titleLabel.text = "..."
        reviewView.card.pronunciationLabel.text = "/.../"
        
        if self.count >= self.cards.count {
            if numOfCardsToStudy == 0 {
                self.showMessage(true)
            } else {
                self.count = 0
                self.show()
            }
        } else {
            if DateHelper.isToday(dateString: self.cards[self.count].nextStudyDay!) {
                //self.showMessage(false)
                let title = self.cards[self.count].content!
                self.setAnswerData(word: title)
            } else {
                self.count += 1
                self.show()
            }
        }
    }
    
    func setAnswerData(word: String) {
        AnswerRepository.search(
        word: word,
        completion: { (answer) in
            DispatchQueue.main.async {
                self.reviewView.card.titleLabel.text = word
                if let pronunciation = answer.pronunciation {
                    self.reviewView.card.pronunciationLabel.text = "/\(pronunciation)/"
                } else {
                    self.reviewView.card.pronunciationLabel.text = "/.../"
                }
                self.definitions = answer.definitions
            }
        })
    }
    
    func showMessage(_ value: Bool) {
        self.reviewView.card.isHidden = value
        self.reviewView.buttonsStack.isHidden = value
        self.reviewView.cardMessage.isHidden = !value
    }
    
    func getNumOfCardsToStudy() -> Int {
        var num = 0
        for card in self.cards {
            if DateHelper.isToday(dateString: card.nextStudyDay!) {
                num += 1
            }
        }
        return num
    }
    
    func update(val: Int) {
        
        let algorithmData = Classification.classificate(val: val, lastDayIncremented: Int(self.cards[self.count].lastDaysIncremented))

        if algorithmData.days != 0 { // veririca se há valores a serem atualizados
            // Atualiza os valores no card.
            self.cards[self.count].nextStudyDay = DateHelper.incrementDate(
                data: self.cards[self.count].nextStudyDay!,
                val: algorithmData.days
            )
            self.cards[self.count].lastDaysIncremented = Int64(algorithmData.lastIncrement)
        }
        // Solicita o salvamento da lista de cards no arquivo.
        self.cardRepository.save()
    }
    
}

// MARK: - Extensions

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    // Number of cells.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.definitions.count
    }
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        cell.configure(definition: self.definitions[indexPath.row])
        
        return cell
    }
}
