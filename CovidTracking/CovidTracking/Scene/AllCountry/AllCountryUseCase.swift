//
//  AllCountryUseCase.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol AllCountryUseCaseType {
    func filter(text: String) -> [CodeCountries]
    func saveTrackingCountry(country: String)
}

struct AllCountryUseCase: AllCountryUseCaseType {
    func filter(text: String) -> [CodeCountries] {
        let datasource = AllCountry.allCodeCountry()
        let newData = filter(list: datasource, string: text)
        return newData
    }
    
    func filter(list: [CodeCountries], string: String) -> [CodeCountries] {
        return list.filter { (country) -> Bool in
            return country.name.range(of: string,
                                      options: .caseInsensitive,
                                      range: nil,
                                      locale: nil) != nil
        }
    }
    
    func saveTrackingCountry(country: String) {
        CoreDataManager.FollowCountryManager.shared.addNewCountry(countryName: country).subscribe{ value in
            switch value {
            case .error(let error):
                print(error.localizedDescription)
            case .completed:
                print("Add success \(country)")
            }
        }
        .dispose()
    }
}
