//
//  BaseNavigationController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    func configureViews() {
        
        delegate = self
        
        navigationBar.do {
            $0.isTranslucent = false
            $0.backgroundColor = .white
        }
    }
}

extension BaseNavigationController: UINavigationControllerDelegate {
    
}
