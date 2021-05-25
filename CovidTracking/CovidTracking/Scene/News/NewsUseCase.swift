//
//  NewsUseCase.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol NewsUseCaseType {
    func getNews() -> Observable<[Articles]>
}

struct NewsUseCase: NewsUseCaseType {
    func getNews() -> Observable<[Articles]> {
        return Observable.just(DefaultLocation.mockNews)
    }
    
}
