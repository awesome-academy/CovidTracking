//
//  APIServices+getNews.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift

extension APIServices {
    func getNews() -> Observable<[Articles]> {
        return APIServices.shared.request(URL: NewsURLs.baseURL, responseType: CovidNews.self)
            .map { $0.articles }
            .catchAndReturn([])
    }
}
