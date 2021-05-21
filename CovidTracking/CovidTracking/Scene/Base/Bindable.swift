//
//  Bindable.swift
//  CovidTracking
//
//  Created by Tiến on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

protocol Bindable {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}
