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
    
    let navigator: RankNavigatorType
    
    var check = BehaviorRelay<Bool>(value: true)
            
    struct Input {
        let loadTrigger: Driver<Void>
        let sortSelected: Driver<Void>
        let cellSeletced: Driver<IndexPath>
    }
    
    struct Output {
        let details: Driver<[Details]>
        let changeBarButtonTitle: Driver<String>
        let pushToDetails: Driver<Void>
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
        
        let sorted = input.sortSelected
            .withLatestFrom(details) { _, details -> [Details] in
                let details = self.check.value
                    ? details.sorted { $0.confirmed < $1.confirmed }
                    : details.sorted { $0.confirmed > $1.confirmed }
                self.check.accept(!self.check.value)
                return details
        }
        
        let displayData = Driver.merge(details, sorted)
        
        let newTitle = input.sortSelected
            .map { self.check.value ? L10n.decrease.localized() : L10n.increase.localized() }
        
        let selected = input.cellSeletced
            .withLatestFrom(displayData) { indexPath, details in
                return details[indexPath.row]
            }
            .do(onNext: { details in
                self.navigator.pushToDetails(details: details)

            })
            .mapToVoid()
        
        return Output(details: displayData,
                      changeBarButtonTitle: newTitle,
                      pushToDetails: selected)
        
    }
    
}
