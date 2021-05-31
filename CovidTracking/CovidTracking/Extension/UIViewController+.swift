//
//  UIViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/24/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAddCountryAlert(message: String, completion: (() -> Void)? = nil) {
        let ac = UIAlertController(title: L10n.trackingCountryAlert.localized(),
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            completion?()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
    func changeLanguageAlert(message: String) {
        let ac = UIAlertController(title: L10n.changeLanguage.localized(),
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)

        ac.addAction(okAction)
        present(ac, animated: true)
    }
}
