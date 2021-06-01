//
//  ChangeLanguageNavigator.swift
//  CovidTracking
//
//  Created by Tiến on 5/31/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

protocol ChangeLanguageNavigatorType {
    func changeLanguageAlert(message: String)
}

struct ChangeLanguageNavigator: ChangeLanguageNavigatorType {
    unowned let navigationController: UINavigationController
    func changeLanguageAlert(message: String) {
        navigationController.changeLanguageAlert(message: message)
    }
}
