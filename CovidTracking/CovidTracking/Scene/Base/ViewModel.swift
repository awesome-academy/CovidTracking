//
//  ViewModel.swift
//  CovidTracking
//
//  Created by Tiến on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift

public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
