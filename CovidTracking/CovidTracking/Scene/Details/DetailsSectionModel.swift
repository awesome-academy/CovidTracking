//
//  DetailsSectionModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/26/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxDataSources
import UIKit

enum DetailsSectionModel {
    case detail(items: [SectionItems])
}

enum SectionItems {
    case about(model: Details)
    case info(model: Details)
    case chart(model: Details)
}

extension DetailsSectionModel: SectionModelType {
    
    typealias Item = SectionItems
    
    var items: [SectionItems] {
        switch self {
        case .detail(let items):
            return items.map {$0}
        }
    }
    
    init(original: DetailsSectionModel, items: [Item]) {
        switch original {
        case .detail:
            self = .detail(items: items)
        }
    }
}
