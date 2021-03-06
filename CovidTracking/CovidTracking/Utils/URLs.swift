//
//  URLs.swift
//  CovidTracking
//
//  Created by Tiến on 5/19/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import Localize_Swift

struct CovidURLs {
    
    public static let countryCase = "https://covid-api.mmediagroup.fr/v1/cases?country=%@"
    
    public static let allCovidCase = "https://covid-api.mmediagroup.fr/v1/cases"
    
    public static let confirmedHistory = "https://covid-api.mmediagroup.fr/v1/history?country=%@&status=confirmed"
    
    public static let deathsHistory = "https://covid-api.mmediagroup.fr/v1/history?country=%@&status=deaths"
    
    public static let recoveredHistory = "https://covid-api.mmediagroup.fr/v1/history?country=%@&status=recovered"
    
}

struct NewsURLs {
    public static let baseURL = "https://gnewsapi.net/api/search?q=covid-19&language=\(Localize.currentLanguage())&api_token=\(API.newsToken)"
}
