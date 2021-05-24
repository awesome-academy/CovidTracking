//
//  AllCountryNavigatorType.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol AllCountryNavigatorType {
    
}

struct AllCountryNavigator: AllCountryNavigatorType {
    unowned let navigationController: UINavigationController
}
