//
//  TabBarItems.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

enum TabBarItems {
    case tracking
    case ranking
    case news
    case utilities
    
    var item: UITabBarItem {
        switch self {
        case .tracking:
            return UITabBarItem(title: L10n.trackingTitle,
                                image: Asset.untappedCovid.image,
                                selectedImage: Asset.tappedCovid.image.withRenderingMode(.alwaysOriginal))
        case .ranking:
            return UITabBarItem(title: L10n.rankingTitle,
                                image: Asset.untappedRank.image,
                                selectedImage: Asset.tappedRank.image.withRenderingMode(.alwaysOriginal))
        case .news:
            return UITabBarItem(title: L10n.newsTitle,
                                image: Asset.untappedNews.image,
                                selectedImage: Asset.tappedNews.image.withRenderingMode(.alwaysOriginal))
        case .utilities:
            return UITabBarItem(title: L10n.utilitiesTitle,
                                image: Asset.untappedUtilities.image,
                                selectedImage: Asset.tappedUtilities.image.withRenderingMode(.alwaysOriginal))
        }
    }
}
