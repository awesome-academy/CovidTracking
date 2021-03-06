//
//  NewsNavigator.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

protocol NewsNavigatorType {
    func pushToSafari(urlString: String)
}

struct NewsNavigator: NewsNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func pushToSafari(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let viewController = SFSafariViewController(url: url)
        viewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
