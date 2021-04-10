//
//  UIView+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIView: Loadingprotocol {
    private var indicator: UIActivityIndicatorView {
        if let indicator = subviews.compactMap({$0 as? UIActivityIndicatorView}).first {
            return indicator
        } else {
            let indicator = UIActivityIndicatorView(style: .large)
            addSubview(indicator)
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            indicator.color = .memoGray
            indicator.hidesWhenStopped = true
            return indicator
        }
    }

    @objc func setLoading(_ loading: Bool) {
        if loading {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }
}
