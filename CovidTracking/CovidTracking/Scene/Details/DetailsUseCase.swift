//
//  DetailsUseCase.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/26/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailsUseCaseType {
    func getHistory(url: String) -> Observable<Details>
}

struct DetailUseCase: DetailsUseCaseType {
    func getHistory(url: String) -> Observable<Details> {
        let url = String(format: CovidURLs.confirmedHistory, url )
        return APIServices.shared.getCountryHistoryDetail(url: url)
    }
}
