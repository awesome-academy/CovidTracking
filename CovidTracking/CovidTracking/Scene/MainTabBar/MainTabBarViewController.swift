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
            configureNavigationController(vc: TrackingViewController(), item: TabBarItems.tracking.item),
            configureNavigationController(vc: RankingViewController(), item: TabBarItems.ranking.item),
            createNewsNavi(),
            configureNavigationController(vc: UtilitiesViewController(), item: TabBarItems.utilities.item)
        ]
        
    }
    
    func configureNavigationController(vc: UIViewController, item: UITabBarItem) -> UINavigationController {
        let navigationController = BaseNavigationController(rootViewController: vc)
        vc.tabBarItem = item
        return navigationController
    }
    
    func createNewsNavi() -> UINavigationController {
        let vc = NewsViewController()
        vc.tabBarItem = TabBarItems.news.item
        let newsNavi = UINavigationController(rootViewController: vc)
        let navigator = NewsNavigator(navigationController: newsNavi)
        let usecase = NewsUseCase()
        let viewModel = NewsViewModel(navigator: navigator, useCase: usecase)
        vc.bindViewModel(to: viewModel)
        return newsNavi
    }
}
