//
//  RankingViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

final class RankingViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var sortBarButton: UIBarButtonItem!
    
    var viewModel: RankingViewModel!
        
    let rowHeght: CGFloat = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViews()
        bindView()
    }
    
    func configureViews() {
        title = L10n.rankingTitle.localized()
        tableView.do {
            $0.register(cellType: RankTableViewCell.self)
            $0.rowHeight = rowHeght
            $0.separatorColor = .clear
            $0.backgroundColor = .systemGray6
        }
    }
    
    func configureNavigationBar() {
        sortBarButton = UIBarButtonItem(title: "Sort",
                                        style: .done,
                                        target: nil,
                                        action: nil)
        navigationItem.do {
            $0.rightBarButtonItem = sortBarButton
            $0.rightBarButtonItem?.tintColor = .systemPink
        }
    }
    
    func bindView() {
        viewModel = RankingViewModel()
        bindViewModel()
    }
    
}

extension RankingViewController: Bindable {
    
    func bindViewModel() {
        let input = RankingViewModel.Input(loadTrigger: Driver.just(()))
        
        let output = viewModel.transform(input)
        
        output.details
            .drive(tableView.rx.items) { tableView, index, details in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: RankTableViewCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContent(details: details, order: index)
                return cell
        }
        .disposed(by: rx.disposeBag)
        
    }
    
}
