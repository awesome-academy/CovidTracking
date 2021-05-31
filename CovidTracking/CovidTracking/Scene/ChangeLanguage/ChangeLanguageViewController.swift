//
//  ChangeLanguageViewController.swift
//  CovidTracking
//
//  Created by Tiến on 5/31/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

final class ChangeLanguageViewController: UIViewController, Bindable {
    
    @IBOutlet private weak var vietnameseButton: UIButton!
    @IBOutlet private weak var englishButton: UIButton!
    
    var viewModel: LanguageViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        title = L10n.language.localized()
        vietnameseButton.setTitle(L10n.vietnamese.localized(), for: .normal)
        englishButton.setTitle(L10n.english.localized(), for: .normal)
    }
    
    func bindViewModel() {
        let input = LanguageViewModel.Input(vietnameseTrigger: vietnameseButton.rx.tap.asDriver(),
                                            englishTrigger: englishButton.rx.tap.asDriver())
        let output = viewModel.transform(input)
        
        output.vietnameseAction
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.englishAction
            .drive()
            .disposed(by: rx.disposeBag)
    }

}
