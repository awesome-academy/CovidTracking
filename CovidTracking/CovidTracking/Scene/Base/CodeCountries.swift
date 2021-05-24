//
//  CodeCountry.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/22/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

struct CodeCountries {
    var countryCode: String?
    var name: String
    var flag: String
}

extension CodeCountries {
    init() {
        self.init(countryCode: "",
                  name: "",
                  flag: "")
    }
}
