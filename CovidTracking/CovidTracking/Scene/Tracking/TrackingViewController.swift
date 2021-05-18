//
//  TrackingViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Localize_Swift

final class TrackingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    private func configureViews() {
        title = L10n.trackingTitle.localized()
        
        view.backgroundColor = .systemPink
    }
}
