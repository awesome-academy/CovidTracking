//
//  DetailsViewModel.swift
//  CovidTracking
//
//  Created by Tiến on 5/24/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct DetailsViewModel: ViewModel {
    
    let useCase: DetailsUseCaseType
    let details: Details
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let title: Driver<String>
        let details: Driver<[DetailsSectionModel]>
    }
    
    func transform(_ input: Input) -> Output {
        let title = input.loadTrigger
            .map { self.details.country }
            .asDriver()
        
        let details = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getHistory(url: self.details.country)
                    .asDriverOnErrorJustComplete()
            }
            .map { history -> [DetailsSectionModel] in
                let section: [DetailsSectionModel] = [
                    .detail(items: [
                        .about(model: self.details),
                        .info(model: self.details),
                        .chart(model: history)
                    ])
                ]
                return section
            }
            .asDriver()
            
        return Output(
            title: title,
            details: details
        )
    }
}
