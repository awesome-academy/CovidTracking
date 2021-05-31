//
//  EmergencyCallViewModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct EmergencyCallViewModel: ViewModel {
    
    let navigator: EmergencyCallNavigator
    let useCase: EmergencyUseCase
    let dataSource = BehaviorRelay<[Phone]>(value: EmergencyCall.phone)

    
    struct Input {
        let loadTrigger: Driver<Void>
        let selectItem: Driver<IndexPath>
        let searchBarInput: Driver<String>
    }
    
    struct Output {
        let emergencyCall: Driver<[Phone]>
        let selected: Driver<Void>
        let searchBar: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let emergencyCall = input.loadTrigger
            .flatMapLatest { _ in
                return self.dataSource
                    .asDriverOnErrorJustComplete()
            }
        
        let selected = input.selectItem
            .withLatestFrom(dataSource.asDriver()) { index, datasource in
                return datasource[index.row]
            }
            .do(onNext: { phone in
                self.navigator.makeCall(number: phone.phoneNumber)
            })
            .mapToVoid()
        
        let searhBar = input.searchBarInput
            .withLatestFrom(dataSource.asDriver()) { ($0, $1) }
            .flatMapLatest { text, data -> Driver<[Phone]> in
                return !text.isEmpty ? .just(self.useCase.filter(text: text)) : .just(data)
            }
            .do(onNext: dataSource.accept)
            .mapToVoid()
        
        return Output(
            emergencyCall: emergencyCall,
            selected: selected,
            searchBar: searhBar)
    }
}
