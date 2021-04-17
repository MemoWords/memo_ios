//
//  UIFont.swift
//  memo
//
//  Created by Elias Ferreira on 16/04/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import UIKit

extension UIFont {
    // MARK: SF Pro Text
    static func memoRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Regular", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }

    static func memoMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Medium", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }

    static func memoMediumItalic(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-MediumItalic", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }

    static func memoSemibold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Semibold", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }

    static func memoBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Bold", size: ofSize) ?? .systemFont(ofSize: ofSize)
    }
}
