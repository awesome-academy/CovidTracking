//
//  TrackingNavigator.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

protocol TrackingNavigatorType {
    func toAddCountryVC()
    func toDetailVC(details: Details)
}

struct TrackingNavigator: TrackingNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toAddCountryVC() {
        let viewController = AllCountryViewController()
        let useCase = AllCountryUseCase()
        let navigator = AllCountryNavigator(navigationController: navigationController)
        let viewModel = AllCountryViewModel(navigator: navigator,
                                            useCase: useCase)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toDetailVC(details: Details) {
        let viewController = DetailsViewController()
        let useCase = DetailUseCase()
        let viewModel = DetailsViewModel(useCase: useCase,
                                         details: details)
        
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
