//
//  ChangeLanguageViewModel.swift
//  CovidTracking
//
//  Created by Tiến on 5/31/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct LanguageViewModel: ViewModel {
    
    let usecase: ChangeLanguageUseCaseType
    let navigator: ChangeLanguageNavigatorType
    
    struct Input {
        let vietnameseTrigger: Driver<Void>
        let englishTrigger: Driver<Void>
    }
    
    struct Output {
        let vietnameseAction: Driver<Void>
        let englishAction: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let vietnameseAction = input.vietnameseTrigger
            .flatMapLatest({
                self.usecase.changeLanguage(languageCode: "vi").asDriverOnErrorJustComplete()
            })
            .do(onNext: {
                self.navigator.changeLanguageAlert(message: L10n.changeLanguageMess.localized())
            })
        
        let englishAction = input.englishTrigger
            .flatMapLatest({
                self.usecase.changeLanguage(languageCode: "en").asDriverOnErrorJustComplete()
            })
            .do(onNext: {
                self.navigator.changeLanguageAlert(message: L10n.changeLanguageMess.localized())
            })
        
        return Output(vietnameseAction: vietnameseAction,
                      englishAction: englishAction)
    }
}
