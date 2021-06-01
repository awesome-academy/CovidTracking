//
//  WashingHandSectionModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxDataSources
import UIKit

enum WashingHandSectionModel {
    case detail(items: [WashingHandSectionItems])
}

enum WashingHandSectionItems {
    case first(model: WashingHand)
    case second(model: WashingHand)
}

extension WashingHandSectionModel: SectionModelType {
    typealias Item = WashingHandSectionItems
    
    var items: [WashingHandSectionItems] {
        switch self {
        case .detail(let items):
            return items.map {$0}
        }
    }
    
    init(original: WashingHandSectionModel, items: [Item]) {
        switch original {
        case .detail:
            self = .detail(items: items)
        }
    }
}
