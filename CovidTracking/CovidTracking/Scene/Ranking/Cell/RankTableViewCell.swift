//
//  RankTableViewCell.swift
//  CovidTracking
//
//  Created by Tiến on 5/20/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class RankTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var orderLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var deathLabel: UILabel!
    @IBOutlet private weak var recoverLabel: UILabel!
    @IBOutlet private weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configView() {
        view.layer.do {
            $0.masksToBounds = false
            $0.cornerRadius = 20
            $0.shadowOpacity = 0.2
            $0.shadowOffset = CGSize(width: 0, height: 2)
            $0.shadowRadius = 3
            $0.shadowColor = UIColor.lightGray.cgColor
        }
        contentView.backgroundColor = .systemGray6
        totalLabel.textColor = .systemRed
        
        orderLabel.do {
            $0.layer.cornerRadius = 10
            $0.layer.backgroundColor = UIColor.systemPink.cgColor
            $0.textColor = .white
        }
    }
    
    func setContent(details: Details, order: Int) {
        orderLabel.text = "\(order + 1)"
        nameLabel.text = details.country
        totalLabel.text = "Total: \(details.confirmed.formattedWithDot)"
        deathLabel.text = "Deaths: \(details.deaths.formattedWithDot)"
        recoverLabel.text = "Recover: \(details.recovered.formattedWithDot)"
    }
    
}
