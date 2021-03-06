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
        let searchBarInput: Driver<String>
        let selectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let allCodeCountry: Driver<[CodeCountries]>
        let searchBar: Driver<Void>
        let showAlert: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let allCodeCountry = input.loadTrigger
            .flatMapLatest { _ in
                return self.dataSource
                    .asDriver(onErrorJustReturn: [])
            }
        
        let searhBar = input.searchBarInput
            .filter {
                !$0.isEmpty
            }
            .do(onNext: {text in
                self.dataSource.accept(self.useCase.filter(text: text))
            })
            .mapToVoid()
        
        let showAlert = input.selectTrigger
            .withLatestFrom(dataSource.asDriver()) { (index, country) in
                return country[index.row]
            }
            .do(onNext: { country in
                self.navigator.showAlert(string: country.name) {
                    self.useCase.saveTrackingCountry(country: country.countryCode ?? "")
                }
            })
            .mapToVoid()
        
        return Output(
            allCodeCountry: allCodeCountry,
            searchBar: searhBar,
            showAlert: showAlert
        )
    }
}
