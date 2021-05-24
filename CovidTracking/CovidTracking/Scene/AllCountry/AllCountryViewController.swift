//
//  AllCountryViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class AllCountryViewController: UIViewController, Bindable {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var viewModel: AllCountryViewModel!
    
    let rowHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        configureTableView()
    }
    
    private func configureViews() {
        title = L10n.country.localized()
    }
    
   private  func configureTableView() {
        tableView.do {
            $0.register(cellType: AllCountryTableViewCell.self)
            $0.rowHeight = rowHeight
            $0.separatorColor = .clear
        }
    }
    
    func bindViewModel() {
        let input = AllCountryViewModel.Input (
            loadTrigger: Driver.just(()),
            searchBarInput: searchBar.rx.text.orEmpty.asDriver(),
            selectTrigger: tableView.rx.itemSelected.asDriver()
        )
        
        let output = viewModel.transform(input)
        
        output.allCodeCountry
            .drive(tableView.rx.items) { tableView, index, codeCountry in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: AllCountryTableViewCell.self)
                cell.configure(model: codeCountry)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.searchBar
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.showAlert
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

