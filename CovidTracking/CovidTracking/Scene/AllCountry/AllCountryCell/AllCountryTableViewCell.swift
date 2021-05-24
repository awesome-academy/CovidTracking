//
//  AllCountryTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/22/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class AllCountryTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    private func configureViews() {
        backView.layer.do {
            $0.masksToBounds = false
            $0.cornerRadius = 15
            $0.shadowOpacity = 0.1
            $0.shadowOffset = CGSize(width: 0, height: 0.5)
            $0.shadowRadius = 1
        }
    }
    
    func configure(model: CodeCountries) {
        nameLabel.text = "\(model.flag)  \(model.name)"
    }
}
