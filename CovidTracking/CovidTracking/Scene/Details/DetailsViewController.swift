//
//  DetailsViewController.swift
//  CovidTracking
//
//  Created by Tiến on 5/24/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RxDataSources
import Reusable

final class DetailsViewController: UIViewController, Bindable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<DetailsSectionModel>
    
    var viewModel: DetailsViewModel!
    private var dataSource: DataSource!
    
    let aboutRowHeight: CGFloat = 300
    let infoRowHeight: CGFloat = 250
    let chartRowHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupTableView()
    }

    func configureView() {
        
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        registerCell()
        setupDataSource()
    }
    
    private func registerCell() {
        tableView.do {
            $0.register(cellType: AboutTableViewCell.self)
            $0.register(cellType: InfoTableViewCell.self)
            $0.register(cellType: ChartTableViewCell.self)
            $0.rx.setDelegate(self)
                .disposed(by: rx.disposeBag)
        }
    }
    
    private func setupDataSource() {
        dataSource = DataSource(configureCell: configureCell)
    }
    
    func bindViewModel() {
        
        let input = DetailsViewModel.Input(loadTrigger: Driver.just(()))
        
        let output = viewModel.transform(input)
        
        output.title
            .drive(self.rx.title)
            .disposed(by: rx.disposeBag)
        
        output.details
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return aboutRowHeight
        case 1:
            return infoRowHeight
        case 2:
            return chartRowHeight
        default:
            return 0
        }
    }
}

extension DetailsViewController {
    private var configureCell: DataSource.ConfigureCell {
        return { dataSource, tableView, indexPath, source in
            switch dataSource[indexPath] {
            case .about(let model):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: AboutTableViewCell.self)
                cell.config(model: model)
                return cell
            case .info(let model):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: InfoTableViewCell.self)
                cell.config(model: model)
                return cell
            case .chart(let model):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ChartTableViewCell.self)
                return cell
            }
        }
    }
}
