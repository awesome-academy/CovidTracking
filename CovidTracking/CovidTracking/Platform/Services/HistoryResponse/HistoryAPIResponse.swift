//
//  HistoryResponse.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/27/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import ObjectMapper
import RxDataSources

struct History {
    var detail: HistoryDetail
}

extension History {
    init() {
        self.init(detail: HistoryDetail())
    }
}

extension History: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        detail <- map["All"]
    }
}

struct HistoryDetail {
    var dates: [String: Int]
}

extension HistoryDetail {
    init() {
        self.init(dates: [:])
    }
}

extension HistoryDetail: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        dates <- map["dates"]
    }
}
