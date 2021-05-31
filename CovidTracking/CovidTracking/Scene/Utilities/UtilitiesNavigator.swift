//
//  UtilitiesNavigator.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/28/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol UtilitiesNavigatorType {
    func toEmergencyCallVC()
}

struct UtilitiesNavigator: UtilitiesNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toEmergencyCallVC() {
        let viewController = EmergencyCallViewController()
        let navigator = EmergencyCallNavigator()
        let useCase = EmergencyUseCase()
        let viewModel = EmergencyCallViewModel(navigator: navigator,
                                               useCase: useCase)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
