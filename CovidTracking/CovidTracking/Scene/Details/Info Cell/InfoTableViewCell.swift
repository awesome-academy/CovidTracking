//
//  InfoTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/26/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class InfoTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var recorveredLabel: UILabel!
    @IBOutlet private weak var activeLabel: UILabel!
    @IBOutlet private weak var deathsLabel: UILabel!
    @IBOutlet private weak var updatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configureView()
    }
    
    private func configureView() {
        backView.layer.do {
            $0.masksToBounds = false
            $0.cornerRadius = 20
            $0.borderWidth = 0.5
            $0.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    func config(model: Details) {
        totalLabel.text = model.confirmed.formattedWithDot
        activeLabel.text = "\((model.confirmed - model.recovered - model.deaths).formattedWithDot)"
        recorveredLabel.text = model.recovered.formattedWithDot
        deathsLabel.text = model.deaths.formattedWithDot
        if !model.updated.isEmpty {
            updatedLabel.text = "updated: \(model.updated)"
        }
    }
}
