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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        bindViewModel()
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
        let useCase = NewsUseCase()
        let navigator = NewsNavigator()
        viewModel = NewsViewModel(navigator: navigator, useCase: useCase)
        let input = NewsViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        
        output.newsList.drive(tableView.rx.items) { tableView, index, news in
            let indexPath = IndexPath(item: index, section: 0)
            let cell: NewsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setContent(article: news)
            return cell
        }
        .disposed(by: rx.disposeBag)
    }
        
}
