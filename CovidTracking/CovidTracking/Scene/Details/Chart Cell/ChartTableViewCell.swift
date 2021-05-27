//
//  ChartTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable
import Charts
import SnapKit

final class ChartTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var chartLabel: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    let  barChart = BarChartView().then {
        $0.legend.font = FontFamily.Arvo.regular.font(size: 17 )
        $0.legend.textColor = .darkGray
        $0.xAxis.labelTextColor = .clear
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        contentView.backgroundColor = .purple
        
        chartLabel.text = L10n.chart.localized()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(barChart)
        
        barChart.snp.makeConstraints { make in
            make.top.equalTo(chartLabel.snp.bottom).inset(-10)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(50)
        }
    }
    
    func config(date: [String], value: [Double] ){
        var entries = [BarChartDataEntry]()
        //datamock
        for x in 0..<10 {
            entries.append(BarChartDataEntry(
                            x: Double(x),
                            y: Double(Int.random(in: 50...200)))
            )
        }
        
        let set = BarChartDataSet(entries: entries, label: L10n.chartLabel.localized())
        
        set.colors = [
            NSUIColor(cgColor: UIColor.systemPink.cgColor)
        ]
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }
}
