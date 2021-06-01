//
//  NewsViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

final class NewsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: NewsViewModel!
    
    let rowHeight: CGFloat = 400
    
    let selectSaveButton = PublishSubject<(Int, Bool)>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        title = L10n.newsTitle.localized()
        tableView.do {
            $0.rowHeight = rowHeight
            $0.register(cellType: NewsTableViewCell.self)
        }
    }
}

extension NewsViewController: Bindable {
    
    func bindViewModel() {
        let input = NewsViewModel.Input(loadTrigger: Driver.just(()),
                                        cellSelected: tableView.rx.itemSelected.asDriver(),
                                        saveButtonTrigger: selectSaveButton.asDriverOnErrorJustComplete() )
        let output = viewModel.transform(input)
        output.newsList.drive(tableView.rx.items) { tableView, index, news in
            let indexPath = IndexPath(item: index, section: 0)
            let cell: NewsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(article: news, index: indexPath.row)
            cell.didTapSaveButton = { [weak self] in
                self?.selectSaveButton.onNext(($0, $1))
            }
            return cell
        }
        .disposed(by: rx.disposeBag)
        
        output.getData
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.loadCoreData
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.pushToSafariView
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.saveButtonAction
            .drive()
            .disposed(by: rx.disposeBag)
        
        tableView.rx.itemSelected
            .do(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .subscribe()
            .disposed(by: rx.disposeBag)
    }
        
}
