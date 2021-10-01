//
//  TabBarTitle.swift
//  memo
//
//  Created by Elias Ferreira on 26/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

enum TabBarItems {
    case collections
    case search
    case settings
    
    var title: String {
        switch self {
        case .collections:
            return Strings.COLLECTIONS_TITLE
        case .search:
            return Strings.SEARCH_TITLE
        case .settings:
            return Strings.SETTINGS_TITLE
        }
    }
}
