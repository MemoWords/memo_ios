//
//  ThemesViewController.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .memoBackground
        configNavBar()
    }

    func configNavBar() {
        navigationItem.title = "Temas"
        navigationItem.largeTitleDisplayMode = .never
    }

}
