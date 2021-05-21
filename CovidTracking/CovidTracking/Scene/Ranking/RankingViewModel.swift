//
//  RankingViewModel.swift
//  CovidTracking
//
//  Created by Tiến on 5/20/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct RankingViewModel: ViewModel {
    
    var dataSource = BehaviorRelay<[Details]>(value: DefaultLocation.mockData)
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let details: Driver<[Details]>
    }
    
    func transform(_ input: Input) -> Output {
        let details = input.loadTrigger
            .withLatestFrom(dataSource.asDriver()) { (_, details) -> [Details] in
                   return details.sorted { $0.confirmed > $1.confirmed }
            }
        return Output(details: details)
    }
    
}
