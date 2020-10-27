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
    let collectionRepository = CollectionRepository()
    var cards = [Card]()
    var collection: Collection?
    var definitions = [Definition]()
    var count = 0
    var numOfCardsToStudy = 0
    
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
        
        // Datasource and delegate.
        reviewView.card.tableView.dataSource = self
        reviewView.card.tableView.delegate  = self

        // Register the xib as a cell.
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
        self.isContentHidden = false
        self.show()
    }
    
    override func loadView() {
        super.loadView()
        self.view = reviewView
    }

    // MARK: - Actions.
    
    @IBAction func showButtonTapped(_ sender: Any) {
        //self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        self.showButtonShowAnswer(value: false)
    }
    
    @IBAction func wrongButtonTapped(_ sender: Any) {
        // Wrong
        self.update(val: 0)
        self.count += 1
        self.showButtonShowAnswer(value: true)
        self.show()
    }
    
    @IBAction func hardButtonTapped(_ sender: Any) {
        // Hard
        self.numOfCardsToStudy -= 1
        self.update(val: 1)
        self.count += 1
        self.showButtonShowAnswer(value: true)
        self.show()
    }
    
    @IBAction func easyButtonTapped(_ sender: Any) {
        // Easy
        self.numOfCardsToStudy -= 1
        self.update(val: 2)
        self.count += 1
        self.showButtonShowAnswer(value: true)
        self.show()
    }
    
    // MARK: - Functions.
    func configNavBar() {
        self.title = self.collection?.name
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func showButtonShowAnswer(value: Bool) {
//        buttonShow.isHidden = !value
//        imageView.isHidden = value
//        tableView.isHidden = value
    }
    
    func show() {
        // Set all the data to screen.
        //self.buttonsIsActive = false
//        labelTotal.text = String("Total: \(self.cards.count)")
//        labelStudy.text = String("Estudar: \(self.numOfCardsToStudy)")
//        self.labelPronunciation.text = "/.../"
//        self.labelTitle.text = "..."
        
        if self.count >= self.cards.count {
            if numOfCardsToStudy == 0 {
                self.showMessage(value: true)
            } else {
                self.count = 0
                self.show()
            }
        } else {
            if DateHelper.isToday(dateString: self.cards[self.count].nextStudyDay!) {
//                if !message.isHidden {
//                    self.showMessage(value: false)
//                }
//                let title = self.cards[self.count].content!
//
//                self.setAnswerData(word: title)
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
//                self.labelTitle.text = word
//                if let pronunciation = answer.pronunciation {
//                    self.labelPronunciation.text = "/\(pronunciation)/"
//                } else {
//                    self.labelPronunciation.text = "/.../"
//                }
//                self.buttonsIsActive = true
//                self.definitions = answer.definitions
//                self.tableView.reloadData()
            }
        })
    }
    
    func showMessage(value: Bool) {
//        labelTitle.isHidden = value
//        labelPronunciation.isHidden = value
//        imageView.isHidden = value
//        tableView.isHidden = value
//        buttonShow.isHidden = value
//        separator.isHidden = value
//        buttonsStack.isHidden = value
//        // Show
//        message.isHidden = !value
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
        return 5
    }
    // Add the cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        //cell.configure(definition: self.definitions[indexPath.row])
        
        return cell
    }
}
