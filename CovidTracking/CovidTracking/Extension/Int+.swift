//
//  Int+.swift
//  CovidTracking
//
//  Created by Tiến on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

extension Int {
    var formattedWithDot: String {
        return Formatter.withDot.string(for: self) ?? ""
    }
}
