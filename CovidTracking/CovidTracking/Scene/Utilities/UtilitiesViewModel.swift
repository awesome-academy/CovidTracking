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
        let selectItem: Driver<IndexPath>
    }
    
    struct Output {
        let utilities: Driver<[UtilitiesModel]>
        let seleted: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let utilities = input.triggerLoad
            .flatMapLatest { _ in
                return dataSource
                    .asDriverOnErrorJustComplete()
            }
        
        let selected = input.selectItem
            .do(onNext: { indexPath in
                switch indexPath.row {
                case 0:
                    navigator.toEmergencyCallVC()
                case 1:
                    break
                case 2:
                    break
                case 3:
                    break
                default:
                    break
                }
            })
            .mapToVoid()
        
        return Output(utilities: utilities,
                      seleted: selected)
    }
}
