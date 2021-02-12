//
//  StudyCollectionView.swift
//  memo
//
//  Created by Elias Ferreira on 09/02/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

class StudyCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        self.backgroundColor = .clear
        self.alwaysBounceHorizontal = true
        self.showsHorizontalScrollIndicator = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
