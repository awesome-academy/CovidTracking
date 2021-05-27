//
//  TrackingViewModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import RxSwiftExt

struct TrackingViewModel: ViewModel {
    
    let navigator: TrackingNavigatorType
    let useCase: TrackingUseCaseType
    
    var dataSource = BehaviorRelay<[Details]>(value: [])
    var coreData = BehaviorRelay<[String]>(value: [])
    
    struct Input {
        let loadTrigger: Driver<Void>
        let removeSelect: Driver<IndexPath>
        let moveSelect: Driver<ItemMovedEvent>
        let addSelect: Driver<Void>
        let selectItem: Driver<IndexPath>
    }
    
    struct Output {
        let details: Driver<[AnimatableSectionModel<String, Details>]>
        let removed: Driver<Void>
        let moved: Driver<Void>
        let add: Driver<Void>
        let getCoreData: Driver<Void>
        let getApiData: Driver<Void>
        let selected: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let details = dataSource.asDriver()
            .map {
                [AnimatableSectionModel(model: "", items: $0) ]
            }
        
        let getCoreData = input.loadTrigger
            .flatMapLatest { _ in
                return useCase.getcoreData()
                    .asDriver(onErrorJustReturn: [])
            }
            .map { data -> [String] in
                let newData = data.map { $0.name ?? "" }
                return newData
            }
            .do(onNext: coreData.accept)
            .mapToVoid()
        
        let getApiData = input.loadTrigger
            .flatMapLatest { _ in
                return useCase.getAllCase()
                    .asDriver(onErrorJustReturn: [])
            }
            .withLatestFrom(coreData.asDriver()) { countries, data -> [Details] in
                
                let newList =  data.map { useCase.filter(list: countries, text: $0) }
                return newList.flatMap {$0}
                
            }
            .do(onNext: dataSource.accept)
            .mapToVoid()
        
        let removed = input.removeSelect
            .withLatestFrom(dataSource.asDriver()) { ($0, $1) }
            .flatMapLatest { indexPath, details -> Driver<[Details]> in
                return useCase.deleteCoreData(abbreviation: details[indexPath.row].abbreviation) {
                    details.with { $0.remove(at: indexPath.row) }
                }
                .asDriver(onErrorJustReturn: [])
            }
            .do(onNext: dataSource.accept)
            .mapToVoid()
        
        let moved = input.moveSelect
            .withLatestFrom(dataSource.asDriver()) { index, details -> [Details] in
                let source = index.destinationIndex
                let destination = index.sourceIndex
                let detail = details[source.row]
                
                return details.with {
                    $0.remove(at: source.row)
                    $0.insert(detail, at: destination.row)
                }
            }
            .do(onNext: dataSource.accept)
            .mapToVoid()
        
        let add = input.addSelect
            .do(onNext: self.navigator.toAddCountryVC)
        
        let selected = input.selectItem
            .withLatestFrom(dataSource.asDriver()) { index, details in
                return details[index.row]
            }
            .do(onNext: { details in
                navigator.toDetailVC(details: details)
            })
            .mapToVoid()
        
        return Output(
            details: details,
            removed: removed,
            moved: moved,
            add: add,
            getCoreData: getCoreData,
            getApiData: getApiData,
            selected: selected
        )
    }
}


