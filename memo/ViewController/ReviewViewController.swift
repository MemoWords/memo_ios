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
            reviewView.cardView.back.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        
        reviewView.cardView.back.tableView.dataSource = self
        reviewView.cardView.back.tableView.delegate  = self

        reviewView.cardView.back.tableView.register(
            UINib.init(nibName: "DefinitionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DefinitionCell"
        )
        
        if let cards = collection?.cards {
            self.cards = cards.allObjects as! [Card]
        }
        
        numOfCardsToStudy = getNumOfCardsToStudy()

        let tap = UITapGestureRecognizer(target: self, action: #selector(showCardTapped))
        reviewView.cardView.addGestureRecognizer(tap)
        
        show()
    }
    
    override func loadView() {
        super.loadView()
        view = reviewView
        reviewView.cardView.message.endAction = endAction
        reviewView.wrongAction = wrongButtonTapped
        reviewView.hardAction = hardButtonTapped
        reviewView.easyAction = easyButtonTapped
    }

    // MARK: - Actions.

    func endAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    func showCardTapped() {
        reviewView.cardView.showContent()
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
        reviewView.cardView.hideContent()

        reviewView.labelStudy.text = String("ESTUDAR: \(numOfCardsToStudy)")
        reviewView.cardView.back.titleLabel.text = "..."
        reviewView.cardView.back.pronunciationLabel.text = "/.../"
        reviewView.cardView.front.titleLabel.text = "..."
        reviewView.cardView.front.pronunciationLabel.text = "/.../"
        
        if self.count >= cards.count {
            if numOfCardsToStudy == 0 {
                reviewView.cardView.showMessage()
                reviewView.hideButtons()
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
            if let response = answer {
                DispatchQueue.main.async {
                    self.reviewView.cardView.back.titleLabel.text = word
                    self.reviewView.cardView.front.titleLabel.text = word

                    if let img = response.definitions[0].image_url {
                        self.reviewView.cardView.back.headerView.img.load(urlString: img)
                    } else {
                        self.reviewView.cardView.back.headerView.img.image = UIImage(named: "photo")
                    }

                    if let pronunciation = response.pronunciation {
                        self.reviewView.cardView.back.pronunciationLabel.text = "/\(pronunciation)/"
                        self.reviewView.cardView.front.pronunciationLabel.text = "/\(pronunciation)/"
                    } else {
                        self.reviewView.cardView.back.pronunciationLabel.text = "/.../"
                        self.reviewView.cardView.front.pronunciationLabel.text = "/.../"
                    }
                    self.definitions = response.definitions
                }
            }
        }
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
