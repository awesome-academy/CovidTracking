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
    
    let barChart = BarChartView().then {
        $0.legend.font = FontFamily.Arvo.regular.font(size: 17 )
        $0.legend.textColor = .darkGray
        $0.xAxis.labelTextColor = .darkGray
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
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(50)
        }
    }
    
    func config(model: Details) {
        if !model.history.isEmpty {
            let newModel = model.history.sorted {
                guard let day1 = $0.key.shortDateUS, let day2 = $1.key.shortDateUS else { return false }
                return day1 > day2
            }
            
            var entries = [BarChartDataEntry]()
            var day = [String]()
            
            let count = 9
            for date in 0...count {
                entries.append(BarChartDataEntry(
                                x: Double(count - date),
                                y: Double(newModel[date].value))
                )
                day.append(String(newModel[count-date].key.dropFirst(count-3)))
            }
            
            let set = BarChartDataSet(entries: entries, label: L10n.chartLabel.localized())
            
            set.colors = [
                NSUIColor(cgColor: UIColor.systemPink.cgColor)
            ]
            
            let data = BarChartData(dataSet: set)
            barChart.data = data
            barChart.xAxis.do {
                $0.valueFormatter = IndexAxisValueFormatter(values: day)
                $0.labelPosition = XAxis.LabelPosition.bottom
            }
        }
    }
}
