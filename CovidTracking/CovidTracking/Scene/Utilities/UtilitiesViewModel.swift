//
//  UtilitiesViewModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/28/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct UtilitiesViewModel: ViewModel {
    
    let navigator: UtilitiesNavigatorType
    let useCase: UtilitiesUseCaseType
    
    let dataSource = BehaviorRelay<[UtilitiesModel]>(value: UtilsDefault.items)
    
    struct Input {
        let triggerLoad: Driver<Void>
    }
    
    struct Output {
        let utilities: Driver<[UtilitiesModel]>
    }
    
    func transform(_ input: Input) -> Output {
        
        let utilities = input.triggerLoad
            .flatMapLatest { _ in
                return dataSource
                    .asDriverOnErrorJustComplete()
            }
        
        return Output(utilities: utilities)
    }
}
