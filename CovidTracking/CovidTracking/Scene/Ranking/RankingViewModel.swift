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
            
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let details: Driver<[Details]>
    }
    
    func transform(_ input: Input) -> Output {
        
        let details = input.loadTrigger
        .flatMapLatest { _  in
            return APIServices.shared.getAllCaseAroudTheWorld()
            .map { (response) -> [Details] in
                response.sorted { $0.confirmed > $1.confirmed }
            }
            .asDriver(onErrorJustReturn: [])
        }
        
        return Output(details: details)
        
    }
    
}
