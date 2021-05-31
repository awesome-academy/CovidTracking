//
//  AllCountry.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

struct AllCountry {
    
    static func flag(country: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for code in country.utf16 {
            if let code = UnicodeScalar(base + Int(code)) {
                usv.append(code)
            }
        }
        return String(usv)
    }
    
    static func allCodeCountry() -> [CodeCountries] {
        var list = [CodeCountries]()
        for code in NSLocale.isoCountryCodes {
            
            let value = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: value)
            let locale = NSLocale(localeIdentifier: value)
            let countryCode = locale.object(forKey: NSLocale.Key.countryCode)
            
            if let abbCode = countryCode {
                var model = CodeCountries()
                model.name = String(name ?? "")
                model.countryCode = abbCode as? String
                model.flag = AllCountry.flag(country: code)
                
                list.append(model)
            }
        }
        return list
    }
}
