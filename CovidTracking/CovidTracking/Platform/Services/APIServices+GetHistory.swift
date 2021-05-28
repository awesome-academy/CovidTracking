//
//  APIServices+GetHistory.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/27/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift

extension APIServices {
    func getCountryHistoryDetail(url: String) -> Observable<Details> {
        return APIServices.shared.request(URL: url, responseType: Country.self)
            .map { $0.details }
            .catchAndReturn(Details())
    }
}
