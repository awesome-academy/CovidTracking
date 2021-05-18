//
//  CovidAPIResponse.swift
//  CovidTracking
//
//  Created by Tiến on 5/19/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import ObjectMapper

//MARK: -GroupResponse
struct GroupResponse {
    var result: [String: Country]
}

extension GroupResponse {
    init() {
        self.init(result: [:])
    }
}

extension GroupResponse: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        result <- map["data"]
    }
}
//MARK: -Country
struct Country {
    var details: Details
}

extension Country {
    init() {
        self.init(details: Details())
    }
}

extension Country: Mappable {
    init?(map: Map) {
        self.init()
    }

    mutating func mapping(map: Map) {
        details <- map["All"]
    }
}
//MARK: - Details
struct Details {
    var confirmed: Int
    var recovered: Int
    var deaths: Int
    var country: String
    var population: Int
    var lifeExpectancy: Double
    var sqKMArea: Int
    var continent: String
    var abbreviation: String
    var location: String
    var capital: String
    var updated: String
    var history: [String: Int]
}

extension Details {
    init() {
        self.init(confirmed: 0,
                  recovered: 0,
                  deaths: 0,
                  country: "",
                  population: 0,
                  lifeExpectancy: 0,
                  sqKMArea: 0,
                  continent: "",
                  abbreviation: "",
                  location: "",
                  capital: "",
                  updated: "",
                  history: [:])
    }
}

extension Details: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        confirmed <- map["confirmed"]
        recovered <- map["recovered"]
        deaths <- map["deaths"]
        country <- map["country"]
        population <- map["population"]
        lifeExpectancy <- map["life_expectancy"]
        sqKMArea <- map["sq_km_area"]
        continent <- map["continent"]
        abbreviation <- map["abbreviation"]
        location <- map["location"]
        capital <- map["capital_city"]
        updated <- map["updated"]
        history <- map["dates"]
    }
    
}
