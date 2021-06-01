//
//  WahsingHandViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class WashingHandViewController: UIViewController, Bindable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<WashingHandSectionModel>
    
    var viewModel: WashingHandViewModel!
    private var dataSource: DataSource!
    
    let rowHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupTableView()
    }
    
    func configureView() {
        title = L10n.washingHand.localized()
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        registerCell()
        setupDataSource()
    }
    
    private func registerCell() {
        tableView.do {
            $0.register(cellType: WashingHandTableViewCell.self)
            $0.rowHeight = rowHeight
        }
    }
    
    private func setupDataSource() {
        dataSource = DataSource(configureCell: configureCell)
    }
    
    func bindViewModel() {
        
        let input = WashingHandViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        
        output.data
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
    }
}

extension WashingHandViewController {
    private var configureCell: DataSource.ConfigureCell {
        return { dataSource, tableView, indexPath, _ in
            switch dataSource[indexPath] {
            case .first(let model):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: WashingHandTableViewCell.self)
                cell.bindViewModel(model: model)
                return cell
            case .second(let model):
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: WashingHandTableViewCell.self)
                cell.bindViewModel(model: model)
                return cell
            }
        }
    }
}
