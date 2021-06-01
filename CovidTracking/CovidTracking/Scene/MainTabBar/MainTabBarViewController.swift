//
//  MainTabBarViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit
import Then

final class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuewViews()
    }
    
    func configuewViews() {
        tabBar.do {
            $0.barTintColor = UIColor.white
            $0.clipsToBounds = true
        }
        
        viewControllers = [
            createTrackingNavigationController(),
            createRankNavigationController(),
            createNewsNavigationController(),
            createUtilitiesNavigationController()
        ]
    }
    
    func configureNavigationController(viewController: UIViewController, item: UITabBarItem) -> UINavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController)
        viewController.tabBarItem = item
        return navigationController
    }
    
    func createUtilitiesNavigationController() -> UINavigationController {
        let viewController = UtilitiesViewController()
        viewController.tabBarItem = TabBarItems.utilities.item
        let useCase = UtilitiesUseCase()
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let navigator = UtilitiesNavigator(navigationController: navigationController)
        let viewModel = UtilitiesViewModel(navigator: navigator, useCase: useCase)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }
    
    func createTrackingNavigationController() -> UINavigationController {
        let viewController = TrackingViewController()
        viewController.tabBarItem = TabBarItems.tracking.item
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let useCase = TrackingUseCase()
        let navigator = TrackingNavigator(navigationController: navigationController)
        let viewModel = TrackingViewModel(navigator: navigator, useCase: useCase)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }
    
    func createNewsNavigationController() -> UINavigationController {
        let viewController = NewsViewController()
        viewController.tabBarItem = TabBarItems.news.item
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let useCase = NewsUseCase()
        let navigator = NewsNavigator(navigationController: navigationController)
        let viewModel = NewsViewModel(navigator: navigator, useCase: useCase)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }
    
    func createRankNavigationController() -> UINavigationController {
        let viewController = RankingViewController()
        viewController.tabBarItem = TabBarItems.ranking.item
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let navigator = RankNavigator(navigationController: navigationController)
        let viewModel = RankingViewModel(navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        return navigationController
    }
}
