//
//  UtilitiesViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class UtilitiesViewController: UIViewController, Bindable {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: UtilitiesViewModel!
    
    let rowHeight: CGFloat = 105
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        title = L10n.utilitiesTitle.localized()
        
        view.backgroundColor = .yellow
        
        tableView.do {
            $0.register(cellType: UtilitiesTableViewCell.self)
            $0.rowHeight = rowHeight
            $0.separatorStyle = .none
        }
    }
    
    func bindViewModel() {
        let input = UtilitiesViewModel.Input(triggerLoad: Driver.just(()),
                                             selectItem: tableView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input)
        
        output.utilities
            .drive(tableView.rx.items) { tableView, index, model in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UtilitiesTableViewCell.self)
                cell.config(model: model)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.seleted
            .drive()
            .disposed(by: rx.disposeBag)
    }
}
