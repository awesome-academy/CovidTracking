//
//  TrackingTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift

final class TrackingTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var capitalLabel: UILabel!
    @IBOutlet private weak var updatedLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var activeLabel: UILabel!
    @IBOutlet private weak var recoveredLabel: UILabel!
    @IBOutlet private weak var deathsLabel: UILabel!
    @IBOutlet private weak var boderView: UIView!
    @IBOutlet private weak var flagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureViews()
    }
    
    private func configureViews() {
        boderView.layer.do {
            $0.masksToBounds = false
            $0.cornerRadius = 30
            $0.shadowOpacity = 0.2
            $0.shadowOffset = CGSize(width: 0, height: 2)
            $0.shadowRadius = 3
            $0.shadowColor = UIColor.lightGray.cgColor
        }
    }
        
    func configureCell(detail: Details) {
        countryLabel.text = detail.country
        capitalLabel.text = detail.capital
        flagLabel.text = AllCountry.flag(country: detail.abbreviation)
        updatedLabel.text = detail.updated
        totalLabel.text = "\(detail.confirmed.formattedWithDot)"
        activeLabel.text = "\((detail.confirmed - detail.deaths - detail.recovered).formattedWithDot)"
        recoveredLabel.text = "\(detail.recovered.formattedWithDot)"
        deathsLabel.text = "\(detail.deaths.formattedWithDot)"
    }
}

