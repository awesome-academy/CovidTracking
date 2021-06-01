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
        let alertViewController = UIAlertController(title: L10n.trackingCountryAlert.localized(),
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            completion?()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancel)
        present(alertViewController, animated: true, completion: nil)
    }
    
    func changeLanguageAlert(message: String) {
        let alertController = UIAlertController(title: L10n.changeLanguage.localized(),
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)

        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
