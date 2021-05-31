//
//  ChangeLanguageUsecase.swift
//  CovidTracking
//
//  Created by Tiến on 5/31/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift

protocol ChangeLanguageUseCaseType {
    func changeLanguage(languageCode: String) -> Observable<Void>
}

struct ChangeLanguageUseCase: ChangeLanguageUseCaseType {
    func changeLanguage(languageCode: String) -> Observable<Void> {
        return Observable.create { observer  in
            LocalizeSystem.shared.setLanguage(languageCode: languageCode)
            observer.onNext(())
            return Disposables.create()
        }
    }
}
