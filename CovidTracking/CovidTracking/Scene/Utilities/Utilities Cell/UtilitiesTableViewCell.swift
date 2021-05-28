//
//  UtilitiesTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/28/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class UtilitiesTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var utilsImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        backView.layer.do {
            $0.masksToBounds = false
            $0.cornerRadius = 15
            $0.shadowOpacity = 0.1
            $0.shadowOffset = CGSize(width: 0, height: 0.5)
            $0.shadowRadius = 1
        }
    }
    
    func config(model: UtilitiesModel) {
        utilsImage.image = model.image
        nameLabel.text = model.name
    }
}
