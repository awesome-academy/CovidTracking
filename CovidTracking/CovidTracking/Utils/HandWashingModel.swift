//
//  HandWashingModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/31/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit

struct WashingHand {
    let title: String
    let steps: [UIImage]
}

struct Hand {
    static let washingNeeded = WashingHand(title: "Các thời điểm cần rửa tay",
                    steps: [
                        Asset.ruatay0.image,
                        Asset.ruatay1.image
                        ]
    )
    
    static let washingSteps = WashingHand(title: "Các bước rủa tay",
                    steps: [
                        Asset.buoc0.image,
                        Asset.buoc1.image,
                        Asset.buoc2.image,
                        Asset.buoc3.image,
                        Asset.buoc4.image,
                        Asset.buoc5.image,
                        Asset.buoc6.image
                    ])
}
