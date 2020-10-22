//
//  ReviewViewController.swift
//  memo
//
//  Created by Elias Ferreira on 17/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    // UI Elements
    @IBOutlet weak var buttonWrong: UIButton!
    @IBOutlet weak var buttonHard: UIButton!
    @IBOutlet weak var buttonEasy: UIButton!
    @IBOutlet weak var buttonsStack: UIStackView!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var buttonShow: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPronunciation: UILabel!
    @IBOutlet weak var labelStudy: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var message: UIStackView!
    
    // Variables
    let cardRepository = CDCardRepository()
    let collectionRepository = CDCollectionRepository()
    var cards = [Card]()
    var collection: Collection?
    var definitions = [Definition]()
    var count = 0
    var numOfCardsToStudy = 0
    
    var buttonsIsActive: Bool? {
        didSet {
            self.buttonEasy.isEnabled = self.buttonsIsActive!
            self.buttonHard.isEnabled = self.buttonsIsActive!
            self.buttonWrong.isEnabled = self.buttonsIsActive!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // -------- Buttons Style -------
        let radius = CGFloat.init(8)
        buttonWrong.layer.cornerRadius = radius
        buttonHard.layer.cornerRadius = radius
        buttonEasy.layer.cornerRadius = radius
        buttonHard.layer.borderWidth = 1.5
        buttonHard.layer.borderColor = UIColor(red: 54/255, green: 101/255, blue: 227/255, alpha: 1.0).cgColor
        // -------- Card Style ----------
        card.layer.cornerRadius = 8
        card.layer.borderWidth = 0.5
        card.layer.borderColor = UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0).cgColor
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.1
        card.layer.shadowRadius = 6
        card.layer.shadowOffset = .init(width: 0, height: 3)
        // -------- Image Style ---------
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        // Sets the title with the collection name.
        self.title = self.collection?.name
        
        // Datasource and delegate.
        tableView.dataSource = self
        tableView.delegate   = self
        
        // Register the xib as a cell.
        tableView.register(
            UINib.init(
                nibName: "DefinitionTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "DefinitionCell"
        )
        
        // self.cards = (self.collection?.cards as? [Card])!
        if let cards = self.collection?.cards {
            self.cards = cards.allObjects as! [Card]
        }
        self.numOfCardsToStudy = self.getNumOfCardsToStudy()
        self.show()
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        self.showButtonShowAnswer(value: false)
    }
    
    func showButtonShowAnswer(value: Bool) {
        buttonShow.isHidden = !value
        imageView.isHidden = value
        tableView.isHidden = value
    }
    
    @IBAction func wrongButtonTapped(_ sender: Any) {
        // Wrong
        //self.update(val: 0)
        self.count += 1
        self.showButtonShowAnswer(value: true)
        self.show()
    }
    
    @IBAction func hardButtonTapped(_ sender: Any) {
        // Hard
        self.numOfCardsToStudy -= 1
        //self.update(val: 1)
        self.count += 1
        self.showButtonShowAnswer(value: true)
        self.show()
    }
    
    @IBAction func easyButtonTapped(_ sender: Any) {
        // Easy
        self.numOfCardsToStudy -= 1
        //self.update(val: 2)
        self.count += 1
        self.showButtonShowAnswer(value: true)
        self.show()
    }
    
    func show() {
        // Set all the data to screen.
        self.buttonsIsActive = false
        labelTotal.text = String("Total: \(self.cards.count)")
        labelStudy.text = String("Estudar: \(self.numOfCardsToStudy)")
        self.labelPronunciation.text = "/.../"
        self.labelTitle.text = "..."
        
        if self.count >= self.cards.count {
            if numOfCardsToStudy == 0 {
                self.showMessage(value: true)
            } else {
                self.count = 0
                self.show()
            }
        } else {
            if DateHelper.isToday(dateString: self.cards[self.count].nextStudyDay!) {
                if !message.isHidden {
                    self.showMessage(value: false)
                }
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
                self.labelTitle.text = word
                if let pronunciation = answer.pronunciation {
                    self.labelPronunciation.text = "/\(pronunciation)/"
                } else {
                    self.labelPronunciation.text = "/.../"
                }
                self.buttonsIsActive = true
                self.definitions = answer.definitions
                self.tableView.reloadData()
            }
        })
    }
    
    func showMessage(value: Bool) {
        labelTitle.isHidden = value
        labelPronunciation.isHidden = value
        imageView.isHidden = value
        tableView.isHidden = value
        buttonShow.isHidden = value
        separator.isHidden = value
        buttonsStack.isHidden = value
        // Show
        message.isHidden = !value
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
        
//        let days = Classification.classificate(
//            val: val,
//            lastDayIncremented: self.cards[self.count].lastDaysIncremented!
//        )
//
//        if days[0] != 0 { // veririca se há valores a serem atualizados
//            // Atualiza os valores no card.
//            repository.collections[self.index!].cards[self.count].nextStudyDay = Helper.incrementDate(
//                data: repository.collections[self.index!].cards[self.count].nextStudyDay,
//                val: days[0]
//            )
//            repository.collections[self.index!].cards[self.count].lastDaysIncremented = days[1]
//        }
//        // Solicita o salvamento da lista de cards no arquivo.
//        repository.save()
    }
    
}

// MARK: - Extensions
extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.definitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        cell.configure(definition: self.definitions[indexPath.row])
        
        return cell
    }
}
