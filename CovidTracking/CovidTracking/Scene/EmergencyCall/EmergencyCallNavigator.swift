//
//  EmergencyCallNavigator.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

protocol EmergencyCallNavigatorType {
    func makeCall(number: String)
}

struct EmergencyCallNavigator: EmergencyCallNavigatorType {
    func makeCall(number: String) {
        if let callUrl = URL(string: "tel://\(number)"),
           UIApplication.shared.canOpenURL(callUrl) {
            UIApplication.shared.open(callUrl)
        } else {
            print("Fail to call")
        }
    }
}
