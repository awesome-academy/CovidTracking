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
    func getHistory() -> Observable<HistoryDetail> {
        return APIServices.shared.request(URL: CovidURLs.confirmedHistory, responseType: History.self)
            .map {
                $0.detail
            }
            .catchAndReturn(HistoryDetail())
    }
}
