//
//  UtilitiesModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/28/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

struct UtilitiesModel {
    let image: UIImage
    let name: String
}

struct UtilsDefault {
    static let items: [UtilitiesModel] = [
        UtilitiesModel(image: Asset.phone.image,
                       name: L10n.emergencyCall.localized()),
        UtilitiesModel(image: Asset.washingHands.image,
                       name: L10n.washingHand.localized()),
        UtilitiesModel(image: Asset.save.image,
                       name: L10n.savedNews.localized()),
        UtilitiesModel(image: Asset.us.image,
                       name: L10n.language.localized())
    ]
}
