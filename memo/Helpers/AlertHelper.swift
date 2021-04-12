//
//  AlertHelper.swift
//  memo
//
//  Created by Elias Ferreira on 11/04/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit
import Toast_Swift

class AlertHelper {

    static func showErrorToast(view: UIView, message: String) {
        var style = ToastStyle()
        style.messageColor = .memoWhite
        style.backgroundColor = .memoRed
        view.makeToast(message, duration: 2.0, position: .center, style: style)
    }

    static func showSuccessToast(view: UIView, message: String) {
        var style = ToastStyle()
        style.messageColor = .memoWhite
        style.backgroundColor = .memoGreen
        view.makeToast(message, duration: 2.0, position: .center, style: style)
    }

    static func showWarningToast(view: UIView, message: String) {
        var style = ToastStyle()
        style.messageColor = .memoWhite
        style.backgroundColor = .memoYellow
        view.makeToast(message, duration: 2.0, position: .center, style: style)
    }

}
