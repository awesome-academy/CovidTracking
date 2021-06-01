//
//  APIServices+GetAll.swift
//  CovidTracking
//
//  Created by Tiến on 5/24/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift

extension APIServices {
    
    func getAllCaseAroudTheWorld() -> Observable<[Details]> {
        return request(URL: CovidURLs.allCovidCase, responseType: GroupResponse.self)
            .map { (response) -> [Details] in
                var details = response.result.values.map {
                    $0.details
                }
                details.removeAll { $0.country.isEmpty}
                return details
        }
        .catchAndReturn([])
        .share(replay: 1, scope: .forever)
    }
    
}
