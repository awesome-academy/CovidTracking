//
//  Error.swift
//  CovidTracking
//
//  Created by Tiến on 5/19/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

enum BaseError: Error {
    case networkError
    case URLError
    case HTTPError
    case mapError
}
