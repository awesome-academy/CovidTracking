//
//  String+.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/27/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

extension String {
    static let shortDateUS = DateFormatter().then {
        $0.dateFormat = "yyyy-MM-dd"
    }
    var shortDateUS: Date? {
        return String.shortDateUS.date(from: self)
    }
}
