//
//  Localize.swift
//  CovidTracking
//
//  Created by Tiến on 5/31/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

class LocalizeSystem: NSObject {

    var bundle: Bundle?

    var appbundle: Bundle?

    static let shared = LocalizeSystem()

    private override init() {
        super.init()
        bundle = Bundle.main
    }

    func setLanguage(languageCode: String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
        appleLanguages?.remove(at: 0)
        appleLanguages?.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj") {
            bundle = Bundle(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }

    func resetLocalization() {
        bundle = Bundle.main
    }

    func getLanguage() -> String {
        guard let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String],
            let prefferedLanguage = appleLanguages.first else {
            return ""
        }
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array.first ?? ""
        }
        return prefferedLanguage
    }
}
