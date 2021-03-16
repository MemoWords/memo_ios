//
//  CardView.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    // MARK: - UIELEMENTS
    
    // Labels
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "car"
        label.font = UIFont(name: "SF Pro Text Medium", size: 30)
        label.textColor = .memoText
        return label
    }()
    
    lazy var pronunciationLabel: UILabel = {
        let label = UILabel()
        label.text = "/kär/"
        label.font = UIFont(name: "SF Pro Text Medium", size: 20)
        label.textColor = .memoGray
        return label
    }()
    
    // Separator
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .memoGray
        return view
    }()
    
    // Image.
    lazy var img: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "photo"))
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // TableView
    let tableView = MemoTableView(frame: .zero, style: .plain)

    // Button Show Answer.
    lazy var showAnswerButton: UIButton = {
        let mediumConfig = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold, scale: .medium)
        let image = UIImage(systemName: "arrowtriangle.down.fill", withConfiguration: mediumConfig)
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("MOSTRAR RESPOSTA", for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Text Bold", size: 16)
        button.setTitleColor(.memoBlue, for: .normal)
        button.backgroundColor = .clear
        button.setImage(image, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.tintColor = .memoBlue
        button.addTarget(self, action: #selector(show), for: .touchUpInside)
        return button
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .memoLightBackground
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ACTIONS
    
    // Show Button Action
    var showAction: (() -> Void)!
    @objc func show(sender: UIButton!) { showAction() }
    
    // MARK: - FUNCTIONS
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 4
        layer.shadowOffset = .init(width: 1, height: 3)
        img.layer.cornerRadius = img.frame.height / 2
    }
    
    func setUpViews() {
        addSubviews(
            titleLabel,
            pronunciationLabel,
            separator,
            img,
            tableView,
            showAnswerButton
        )
        
        configureLabels()
        configureSeparator()
        configureImg()
        configureTableView()
        configureShowAnswerButton()
    }
}
