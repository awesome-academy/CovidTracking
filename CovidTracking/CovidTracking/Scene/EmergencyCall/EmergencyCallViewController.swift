//
//  EmergencyCallViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class EmergencyCallViewController: UIViewController, Bindable {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: EmergencyCallViewModel!

    let rowHeight: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        title = L10n.emergencyCall.localized()
        
        tableView.do {
            $0.register(cellType: EmergencyCallTableViewCell.self)
            $0.rowHeight = rowHeight
        }
    }
    
    func bindViewModel() {
        let input = EmergencyCallViewModel.Input(
            loadTrigger: Driver.just(()),
            selectItem: tableView.rx.itemSelected.asDriver(),
            searchBarInput: searchBar.rx.text.orEmpty.asDriver()
        )
        let output = viewModel.transform(input)
        
        output.emergencyCall
            .drive(tableView.rx.items) { tableView, index, model in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: EmergencyCallTableViewCell.self)
                cell.config(model: model)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.searchBar
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.selected
            .drive()
            .disposed(by: rx.disposeBag)
    }
}
