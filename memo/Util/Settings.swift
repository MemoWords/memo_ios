//
//  Settings.swift
//  memo
//
//  Created by Elias Ferreira on 14/03/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//
import UIKit

class Settings {

    private static var configurations: Settings?
    private var userDefaults: UserDefaults
    var themeNames: [String]

    private init () {
        userDefaults = UserDefaults.standard
        themeNames = ["Padrão do Sistema", "Claro", "Escuro"]
    }

    static func getInstance() -> Settings {
        if Settings.configurations == nil {
            Settings.configurations = Settings()
        }
        return Settings.configurations!
    }

    var theme: UIUserInterfaceStyle {
        get {
            if let raw = userDefaults.value(forKey: ConfigKeys.theme.key) as? Int {
               return UIUserInterfaceStyle(
                    rawValue: raw
               )!
            } else {
                return .unspecified
            }
        }

        set {
            userDefaults.setValue(
                newValue.rawValue,
                forKey: ConfigKeys.theme.key
            )
        }
    }

    var notification: Bool {
        get {
            if let raw = userDefaults.value(forKey: ConfigKeys.notification.key) as? Bool {
               return raw
            } else {
                return false
            }
        }

        set {
            userDefaults.setValue(
                newValue,
                forKey: ConfigKeys.notification.key
            )
        }
    }

    public func getSelectedThemeName() -> String {
        return themeNames[theme.rawValue]
    }
}
