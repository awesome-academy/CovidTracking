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

final class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindViewModel()
    }

    func configureView() {
    }
    
}

extension DetailsViewController: Bindable {
    func bindViewModel() {
        let input = DetailsViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        output.title
            .drive(self.rx.title)
            .disposed(by: rx.disposeBag)
    }
    
}
