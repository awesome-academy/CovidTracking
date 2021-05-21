//
//  Formatter+.swift
//  CovidTracking
//
//  Created by Tiến on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

extension Formatter {
    static let withDot: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}
