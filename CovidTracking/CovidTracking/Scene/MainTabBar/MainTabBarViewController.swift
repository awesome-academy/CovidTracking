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
            configureNavigationController(vc: NewsViewController(), item: TabBarItems.news.item),
            configureNavigationController(vc: UtilitiesViewController(), item: TabBarItems.utilities.item)
        ]
        
    }
    
    func configureNavigationController(vc: UIViewController, item: UITabBarItem) -> UINavigationController {
        let navigationController = BaseNavigationController(rootViewController: vc)
        vc.tabBarItem = item
        return navigationController
    }
    
}
