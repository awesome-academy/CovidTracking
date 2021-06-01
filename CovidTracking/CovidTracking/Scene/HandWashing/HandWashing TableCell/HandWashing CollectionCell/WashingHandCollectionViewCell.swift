//
//  WashingHandCollectionViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class WashingHandCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var stepImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stepImage.layer.cornerRadius = 20
    }
    
    func config(image: UIImage) {
        stepImage.image = image
    }
}
