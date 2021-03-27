//
//  UIImage.swift
//  memo
//
//  Created by Elias Ferreira on 15/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(urlString: String) {

        guard let url = URL(string: urlString) else {
            return
        }

        DispatchQueue.global().async { [self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } 
            }
        }
    }
}
