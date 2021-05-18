//
//  RankingViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import UIKit

final class RankingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    private func configureViews() {
        title = LocalizationSystem.shared.localizedStringForKey(key: L10n.rankingTitle, comment: "")
        
        view.backgroundColor = .blue
    }
}
