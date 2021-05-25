//
//  NewsViewModel.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct NewsViewModel: ViewModel {
    
    let navigator: NewsNavigatorType
    let useCase: NewsUseCaseType
        
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let newsList: Driver<[Articles]>
    }
    
    func transform(_ input: Input) -> Output {
        let newsList = input.loadTrigger
            .flatMapLatest {
                return self.useCase.getNews().asDriver(onErrorJustReturn: [])
        }
        return Output(newsList: newsList)
    }
}
