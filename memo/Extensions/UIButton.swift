//
//  UIButton.swift
//  memo
//
//  Created by Elias Ferreira on 10/04/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

private var key: UInt8 = 42

extension UIButton {
    private var title: String? {
        get {
            objc_getAssociatedObject(self, &key) as? String
        }
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    override func setLoading(_ loading: Bool) {
        super.setLoading(loading)
        if title == nil {
            title = currentTitle
        }

        if loading {
            setTitle(nil, for: .normal)
        } else {
            setTitle(title, for: .normal)
        }
    }
}
