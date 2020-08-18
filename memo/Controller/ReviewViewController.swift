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
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var buttonShow: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -------- Buttons Style -------
        // Radius.
        let radius = CGFloat.init(8)
        buttonWrong.layer.cornerRadius = radius
        buttonHard.layer.cornerRadius = radius
        buttonEasy.layer.cornerRadius = radius
        // Border.
        buttonHard.layer.borderWidth = 1.5
        buttonHard.layer.borderColor = UIColor(red: 54/255, green: 101/255, blue: 227/255, alpha: 1.0).cgColor
        
        // -------- Card Style ----------
        // Radius.
        card.layer.cornerRadius = 8
        // Border.
        card.layer.borderWidth = 0.5
        card.layer.borderColor = UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0).cgColor
        // Shadow.
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.1
        card.layer.shadowRadius = 6
        card.layer.shadowOffset = .init(width: 0, height: 3)
        
        // -------- Image Style ---------
        // Radius.
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        // Datasource and delegate.
        tableView.dataSource = self
        tableView.delegate   = self
        
        // Register the xib as a cell.
        tableView.register(UINib.init(nibName: "DefinitionTableViewCell", bundle: nil), forCellReuseIdentifier: "DefinitionCell")
    
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        // Remove
        buttonEasy.layer.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 245/255, alpha: 1.0).cgColor
        buttonEasy.setTitleColor(UIColor(red: 181/255, green: 182/255, blue: 190/255, alpha: 1.0), for: .disabled)
        buttonEasy.isEnabled = false
        buttonShow.removeFromSuperview()
        // Add
        imageView.isHidden = false
        tableView.isHidden = false
    }
    
    @IBAction func wrongButtonTapped(_ sender: Any) {
        print("Errei!")
    }
    
    @IBAction func hardButtonTapped(_ sender: Any) {
        print("Difícil!")
    }
    
    @IBAction func easyButtonTapped(_ sender: Any) {
        print("Fácil!")
    }
    
}

// MARK: - Extensions
extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefinitionCell", for: indexPath) as! DefinitionTableViewCell
        
        return cell
    }
}
