//
//  TrackingViewController.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/18/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Localize_Swift
import RxSwift
import RxCocoa
import RxDataSources
import NSObject_Rx
import RxSwiftExt

final class TrackingViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    typealias TrackingSectionModel = AnimatableSectionModel<String, Details>
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<TrackingSectionModel>!
    var viewModel: TrackingViewModel!
    
    private var addBarButton: UIBarButtonItem!
    private var editBarButton: UIBarButtonItem!
    
    private let rowHeight: CGFloat = 220
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureNavigationBar()
        configureTableView()
        
        bindView()
    }
    
    private func bindView() {
        viewModel = TrackingViewModel()
        bindViewModel()
    }
    
    private func configureViews() {
        title = L10n.trackingTitle.localized()
        
        view.backgroundColor = .systemPink
    }
    
    private func configureNavigationBar() {
        editBarButton = UIBarButtonItem(barButtonSystemItem: .edit,
                                         target: self, action: nil)
        addBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: self, action: nil)
        
        navigationItem.do {
            $0.rightBarButtonItem = addBarButton
            $0.rightBarButtonItem?.tintColor = .systemPink
            $0.leftBarButtonItem = editBarButton
            $0.leftBarButtonItem?.tintColor = .systemPink
        }
    }
    
    private func configureTableView() {
        registerCell()
        configureDataSource()
    }
    
    private func registerCell() {
        tableView.do {
            $0.register(cellType: TrackingTableViewCell.self)
            $0.rowHeight = rowHeight
            $0.separatorColor = .clear
        }
    }
    
    private func configureDataSource() {
        dataSource = RxTableViewSectionedAnimatedDataSource<TrackingSectionModel>(
            animationConfiguration: AnimationConfiguration(insertAnimation: .right,
                                                           reloadAnimation: .none,
                                                           deleteAnimation: .left),
            configureCell: configureCell,
            canEditRowAtIndexPath: canEditRowAtIndexPath,
            canMoveRowAtIndexPath: canMoveRowAtIndexPath)
    }
}

extension TrackingViewController {
    private var configureCell: RxTableViewSectionedAnimatedDataSource<TrackingSectionModel>.ConfigureCell {
        return { _, tableView, indexPath, detail in
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TrackingTableViewCell.self)
            cell.configureCell(detail: detail)
            return cell
        }
    }
    
    private var canEditRowAtIndexPath: RxTableViewSectionedAnimatedDataSource<TrackingSectionModel>.CanEditRowAtIndexPath {
        return { [unowned self] _, _ in
            return self.tableView.isEditing
        }
    }
    
    private var canMoveRowAtIndexPath: RxTableViewSectionedAnimatedDataSource<TrackingSectionModel>.CanMoveRowAtIndexPath {
        return { _, _ in
            return true
        }
    }
}

extension TrackingViewController: Bindable {
    func bindViewModel() {
        bindDataSource()
        bindSelected()
        bindNavigationBar()
    }
    
    private func bindDataSource() {
        
        let input = TrackingViewModel.Input(
            loadTrigger: Driver.just(()),
            removeSelect: tableView.rx.itemDeleted.asDriver(),
            moveSelect: tableView.rx.itemMoved.asDriver()
        )
        
        let output = viewModel.transform(input)
        
        output.details
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: rx.disposeBag)
        
        output.removed
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.moved
            .drive()
            .disposed(by: rx.disposeBag)
    }
    
    private func bindSelected() {
        tableView.rx.modelSelected(Details.self)
            .asDriver()
            .drive(onNext: { detail in
                print(detail)
            })
            .disposed(by: rx.disposeBag)
    }
    
    private func bindNavigationBar() {
        editBarButton.rx.tap.asDriver()
            .map { [unowned self] in
                self.tableView.isEditing
            }
            .not()
            .drive(editingBinder)
            .disposed(by: rx.disposeBag)
    }
}

extension TrackingViewController {
    private var editingBinder: Binder<Bool> {
        return Binder(self) { vc, editing in
            vc.tableView.setEditing(editing, animated: true)
        }
    }
}
