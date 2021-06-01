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
    func pushToLanguage()
    func toWashingHandVC()
    func pushToSavedNews()
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
    
    func pushToLanguage() {
        let viewController = ChangeLanguageViewController()
        let navigator = ChangeLanguageNavigator(navigationController: navigationController)
        let usecase = ChangeLanguageUseCase()
        let viewModel = LanguageViewModel(usecase: usecase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toWashingHandVC() {
        let viewController = WashingHandViewController()
        let viewModel = WashingHandViewModel()
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushToSavedNews() {
        let vc = NewsViewController()
        let navigator = NewsNavigator(navigationController: navigationController)
        let usecase = NewsUseCase()
        let viewModel = NewsViewModel(navigator: navigator, useCase: usecase, isSavedNews: true)
        vc.bindViewModel(to: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
