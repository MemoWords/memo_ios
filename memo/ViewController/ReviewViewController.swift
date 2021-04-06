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
            reviewView.cardBack.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        
        reviewView.cardBack.tableView.dataSource = self
        reviewView.cardBack.tableView.delegate  = self

        reviewView.cardBack.tableView.register(
            UINib.init(nibName: "DefinitionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DefinitionCell"
        )
        
        if let cards = collection?.cards {
            self.cards = cards.allObjects as! [Card]
        }
        
        numOfCardsToStudy = getNumOfCardsToStudy()

        let tap = UITapGestureRecognizer(target: self, action: #selector(showCardTapped))
        reviewView.cardFront.addGestureRecognizer(tap)
        
        show()
    }
    
    override func loadView() {
        super.loadView()
        view = reviewView
        reviewView.wrongAction = wrongButtonTapped
        reviewView.hardAction = hardButtonTapped
        reviewView.easyAction = easyButtonTapped
    }

    // MARK: - Actions.

    @objc
    func showCardTapped() {
        showContent()
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

    func showContent() {
        UIView.transition(with: self.reviewView.cardBack, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.reviewView.cardBack.isHidden = false

        }, completion: {_ in
            self.reviewView.cardFront.isHidden = true
        })
    }

    func configNavBar() {
        navigationItem.title = collection?.name
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func show() {
        //showContent(false)
        //showMessage(false)

        reviewView.labelStudy.text = String("ESTUDAR: \(numOfCardsToStudy)")
        reviewView.cardBack.titleLabel.text = "..."
        reviewView.cardBack.pronunciationLabel.text = "/.../"
        reviewView.cardFront.titleLabel.text = "..."
        reviewView.cardFront.pronunciationLabel.text = "/.../"
        
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
            if let response = answer {
                DispatchQueue.main.async {
                    self.reviewView.cardBack.titleLabel.text = word
                    self.reviewView.cardFront.titleLabel.text = word

                    if let img = response.definitions[0].image_url {
                        self.reviewView.cardBack.headerView.img.load(urlString: img)
                    } else {
                        self.reviewView.cardBack.headerView.img.image = UIImage(named: "photo")
                    }

                    if let pronunciation = response.pronunciation {
                        self.reviewView.cardBack.pronunciationLabel.text = "/\(pronunciation)/"
                        self.reviewView.cardFront.pronunciationLabel.text = "/\(pronunciation)/"
                    } else {
                        self.reviewView.cardBack.pronunciationLabel.text = "/.../"
                        self.reviewView.cardFront.pronunciationLabel.text = "/.../"
                    }
                    self.definitions = response.definitions
                }
            }
        }
    }
    
    func showMessage(_ value: Bool) {

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
