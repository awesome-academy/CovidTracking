//
//  TrackingUseCase.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TrackingUseCaseType {
    func getAllCase() -> Observable<[Details]>
    func getcoreData() -> Observable<[FollowCountry]>
    func filter(list: [Details], text: String) -> [Details]
    func deleteCoreData(abbreviation: String,completion: @escaping  () -> [Details] ) -> Observable<[Details]>
}

struct TrackingUseCase: TrackingUseCaseType {
    
    func deleteCoreData(abbreviation: String, completion: @escaping () -> [Details]) -> Observable<[Details]> {
        return CoreDataManager.FollowCountryManager.shared.deleteCountry(countryName: abbreviation, completion: completion)
    }
    
    func getAllCase() -> Observable<[Details]> {
        return APIServices.shared.getAllCaseAroudTheWorld()
    }
    
    func getcoreData() -> Observable<[FollowCountry]> {
        return CoreDataManager.FollowCountryManager.shared.fetchAllCountryData()
    }
    
    func filter(list: [Details], text string: String) -> [Details] {
        return list.filter { (detail) -> Bool in
            return detail.abbreviation.range(of: string, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
    }

}

