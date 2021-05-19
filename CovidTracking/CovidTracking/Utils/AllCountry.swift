//
//  AllCountry.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

struct AllCountry {
    
    static func flag(country:String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in country.utf16 {
            //usv.append(UnicodeScalar(base + Int(i)))
            if let code = UnicodeScalar(base + Int(i)) {
                usv.append(code)
            }
        }
        return String(usv)
    }
}
