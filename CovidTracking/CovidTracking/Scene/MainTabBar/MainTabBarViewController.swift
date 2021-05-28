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
    
    func configureNavigationController(vc: UIViewController, item: UITabBarItem) -> UINavigationController {
        let navigationController = BaseNavigationController(rootViewController: vc)
        vc.tabBarItem = item
        return navigationController
    }
    
    func createUtilitiesNavigationController() -> UINavigationController {
        let vc = UtilitiesViewController()
        vc.tabBarItem = TabBarItems.utilities.item
        let useCase = UtilitiesUseCase()
        let navigator = UtilitiesNavigator()
        let viewModel = UtilitiesViewModel(navigator: navigator, useCase: useCase)
        vc.bindViewModel(to: viewModel)
        let navigationController = BaseNavigationController(rootViewController: vc)
        return navigationController
    }
    
    func createTrackingNavigationController() -> UINavigationController {
        let vc = TrackingViewController()
        vc.tabBarItem = TabBarItems.tracking.item
        let navigationController = BaseNavigationController(rootViewController: vc)
        let useCase = TrackingUseCase()
        let navigator = TrackingNavigator(navigationController: navigationController)
        let viewModel = TrackingViewModel(navigator: navigator, useCase: useCase)
        vc.bindViewModel(to: viewModel)
        return navigationController
    }
    
    func createNewsNavigationController() -> UINavigationController {
        let vc = NewsViewController()
        vc.tabBarItem = TabBarItems.news.item
        let navigationController = BaseNavigationController(rootViewController: vc)
        let useCase = NewsUseCase()
        let navigator = NewsNavigator(navigationController: navigationController)
        let viewModel = NewsViewModel(navigator: navigator, useCase: useCase)
        vc.bindViewModel(to: viewModel)
        return navigationController
    }
    
    func createRankNavigationController() -> UINavigationController {
        let vc = RankingViewController()
        vc.tabBarItem = TabBarItems.ranking.item
        let navigationController = BaseNavigationController(rootViewController: vc)
        let navigator = RankNavigator(navigationController: navigationController)
        let viewModel = RankingViewModel(navigator: navigator)
        vc.bindViewModel(to: viewModel)
        return navigationController
    }
}
