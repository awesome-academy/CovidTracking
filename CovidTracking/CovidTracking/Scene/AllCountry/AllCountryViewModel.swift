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
    
    var dataSource = BehaviorRelay<[CodeCountries]>(value: AllCountry.allCodeCountry())
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let allCodeCountry: Driver<[CodeCountries]>
    }
    
    func transform(_ input: Input) -> Output {
        let allCodeCountry = input.loadTrigger
            .flatMapLatest { _ in
                return self.dataSource
                    .asDriver(onErrorJustReturn: [])
            }
        
        return Output(
            allCodeCountry: allCodeCountry
        )
    }
}
