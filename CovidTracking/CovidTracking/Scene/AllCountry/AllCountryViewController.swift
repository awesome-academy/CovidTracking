//
//  AllCountryViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit

final class AllCountryViewController: UIViewController, Bindable {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: AllCountryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        
    }
}

