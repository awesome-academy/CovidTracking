//
//  AllCountryViewModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AllCountryViewModel: ViewModel {
    
    let navigator: AllCountryNavigatorType
    let useCase: AllCountryUseCaseType
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input) -> Output {
        return Output()
    }
}
