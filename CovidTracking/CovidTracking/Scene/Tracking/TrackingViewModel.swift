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
    
    var dataSource = BehaviorRelay<[Details]>(value: DefaultLocation.defaulLocation)

    struct Input {
        let loadTrigger: Driver<Void>
        let removeSelect: Driver<IndexPath>
        let moveSelect: Driver<ItemMovedEvent>
    }
    
    struct Output {
        let details: Driver<[AnimatableSectionModel<String, Details>]>
        let removed: Driver<Void>
        let moved: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let details = input.loadTrigger
            .flatMapLatest { _ in
                return self.dataSource
                    .asDriver(onErrorJustReturn: [])
            }
            .map {
                [AnimatableSectionModel(model: "", items: $0) ]
            }
        
        let removed = input.removeSelect
            .withLatestFrom(dataSource.asDriver()) { indexPath, details -> [Details] in
                return details.with {
                    $0.remove(at: indexPath.row)
                }
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
        
        return Output(
            details: details,
            removed: removed,
            moved: moved
        )
    }
}


