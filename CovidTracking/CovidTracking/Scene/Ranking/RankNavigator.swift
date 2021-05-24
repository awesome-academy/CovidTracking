//
//  RankNavigator.swift
//  CovidTracking
//
//  Created by Tiến on 5/24/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

protocol RankNavigatorType {
    func pushToDetails(countryName: String)
}

struct RankNavigator: RankNavigatorType {
        
    unowned let navigationController: UINavigationController
    
    func pushToDetails(countryName: String) {
        let vc = DetailsViewController()
        let viewModel = DetailsViewModel(countryName: countryName)
        vc.bindViewModel(to: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
