//
//  AboutTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/26/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class AboutTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var capitapLabel: UILabel!
    @IBOutlet private weak var km2Label: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var latLabel: UILabel!
    @IBOutlet private weak var longLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        backView.layer.do {
            $0.cornerRadius = 20
        }
    }
    
    func config(model: Details) {
        countryLabel.text = "\(AllCountry.flag(country: model.abbreviation))  \(model.country)"
        locationLabel.text = ":    \(model.location)"
        capitapLabel.text = ":    \(model.capital)"
        km2Label.text = ":    \(model.sqKMArea.formattedWithDot)"
        populationLabel.text = ":    \(model.population.formattedWithDot)"
        latLabel.text = ":    \(model.lat)"
        longLabel.text = ":    \(model.long)"
    }
}
