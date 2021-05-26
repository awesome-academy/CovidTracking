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
    func pushToDetails(details: Details)}

struct RankNavigator: RankNavigatorType {
        
    unowned let navigationController: UINavigationController
    
    func pushToDetails(details: Details) {
        let viewController = DetailsViewController()
        let useCase = DetailUseCase()
        let viewModel = DetailsViewModel(useCase: useCase,
                                        details: details)
        
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
