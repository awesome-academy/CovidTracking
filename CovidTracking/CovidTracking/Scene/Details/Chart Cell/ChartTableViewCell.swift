//
//  ChartTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable

final class ChartTableViewCell: UITableViewCell, NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
       configureView()
    }
    
    private func configureView() {
        contentView.backgroundColor = .purple
    }
}
