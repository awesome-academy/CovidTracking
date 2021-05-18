//
//  UtilitiesViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//


import UIKit

final class UtilitiesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    private func configureViews() {
        title = L10n.utilitiesTitle.localized()
        
        view.backgroundColor = .yellow
    }
}

