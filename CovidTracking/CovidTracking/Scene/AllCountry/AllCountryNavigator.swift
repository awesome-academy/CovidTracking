//
//  AllCountryNavigatorType.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol AllCountryNavigatorType {
    func showAlert(string: String, completion: @escaping () -> Void)
}

struct AllCountryNavigator: AllCountryNavigatorType {
    func showAlert(string: String, completion: @escaping (() -> Void)) {
        navigationController.showAddCountryAlert(message: string, completion: completion)
    }
    
    unowned let navigationController: UINavigationController
}
