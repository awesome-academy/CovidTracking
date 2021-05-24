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
    
    var countryName: String
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let title: Driver<String>
    }
    
    func transform(_ input: Input) -> Output {
        let title = input.loadTrigger
            .map { self.countryName }
            .asDriver()
            
        return Output(title: title)
    }
    
}
