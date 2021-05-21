//
//  DefaultLocation.swift
//  CovidTracking
//
//  Created by Tiến on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.

import Foundation

struct DefaultLocation {

    //MARK: - Mock data
    
    static let Vietnam = Details(confirmed: 4547,
                                 recovered: 2687,
                                 deaths: 37,
                                 country: "Vietnam",
                                 population: 990000,
                                 lifeExpectancy: 54.12,
                                 sqKMArea: 123123,
                                 continent: "",
                                 abbreviation: "VN",
                                 location: "",
                                 capital: "Hanoi",
                                 updated: "05/19/2021",
                                 history: [:])
    
    static let Us = Details(confirmed: 33774945,
                            recovered: 27253327,
                            deaths: 601330,
                            country: "Us",
                            population: 990000,
                            lifeExpectancy: 54.12,
                            sqKMArea: 123123,
                            continent: "",
                            abbreviation: "US",
                            location: "",
                            capital: "Hanoi",
                            updated: "05/19/2021",
                            history: [:])
    
    static let India = Details(confirmed: 25495144,
                               recovered: 21979703,
                               deaths: 283276,
                               country: "India",
                               population: 990000,
                               lifeExpectancy: 54.12,
                               sqKMArea: 123123,
                               continent: "IN",
                               abbreviation: "IN",
                               location: "",
                               capital: "Hanoi",
                               updated: "05/19/2021",
                               history: [:])
    
    static let Brazin = Details(confirmed: 1342133,
                                recovered: 25341,
                                deaths: 12331,
                                country: "Brazin",
                                population: 990000,
                                lifeExpectancy: 54.12,
                                sqKMArea: 123123,
                                continent: "",
                                abbreviation: "BR",
                                location: "",
                                capital: "Hanoi",
                                updated: "05/19/2021",
                                history: [:])
    
    static let mockData = [
           DefaultLocation.Us,
           DefaultLocation.Vietnam,
           DefaultLocation.Brazin,
           DefaultLocation.India,
           DefaultLocation.Us,
           DefaultLocation.Vietnam,
           DefaultLocation.Brazin,
           DefaultLocation.India,
           DefaultLocation.Us,
           DefaultLocation.Vietnam,
           DefaultLocation.Brazin,
           DefaultLocation.India,
       ]

    func flag(country:String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in country.utf16 {
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
}
