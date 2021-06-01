//
//  WashingHandViewModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct WashingHandViewModel: ViewModel {
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let data: Driver<[WashingHandSectionModel]>
    }
    
    func transform(_ input: Input) -> Output {
        
        let data = input.loadTrigger
            .map { _ -> [WashingHandSectionModel] in
                let section: [WashingHandSectionModel] = [
                    .detail(items: [
                        .first(model: Hand.washingNeeded),
                        .second(model: Hand.washingSteps)
                    ])
                ]
                return section
            }
        
        return Output(data: data)
    }
}
