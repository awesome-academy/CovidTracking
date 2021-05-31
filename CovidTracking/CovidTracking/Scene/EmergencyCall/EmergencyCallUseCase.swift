//
//  EmergencyCallUseCase.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

protocol EmergencyUseCaseType {
    func filter(text: String) -> [Phone]
}

struct EmergencyUseCase: EmergencyUseCaseType {
    func filter(text: String) -> [Phone] {
        let datasource = EmergencyCall.phone
        let newData = filter(list: datasource, string: text)
        return newData
    }
    
    func filter(list: [Phone], string: String) -> [Phone] {
        return list.filter { (country) -> Bool in
            return country.name.range(of: string,
                                      options: .caseInsensitive,
                                      range: nil,
                                      locale: nil) != nil
        }
    }
}
