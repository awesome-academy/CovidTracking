//
//  EmergencyCallTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class EmergencyCallTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(model: Phone) {
        nameLabel.text = model.name
        phoneLabel.text = model.phoneNumber
    }
}
