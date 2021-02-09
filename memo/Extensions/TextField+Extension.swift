//
//  TextField+Extension.swift
//  memo
//
//  Created by Elias Ferreira on 27/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
