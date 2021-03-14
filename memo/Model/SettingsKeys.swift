//
//  SettingsKeys.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import Foundation

enum ConfigKeys {
    case theme
    case notification

    var key: String {
        switch self {
        case .theme:
            return "theme"
        case .notification:
            return "notification"
        }
    }
}
