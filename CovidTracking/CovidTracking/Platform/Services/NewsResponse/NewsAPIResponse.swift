//
//  NewsAPIResponse.swift
//  CovidTracking
//
//  Created by Tiến on 5/19/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import ObjectMapper

struct CovidNews {
    var dateTime: String
    var timeStamp: Int
    var countArticles: Int
    var articles: [Articles]
}

extension CovidNews {
    init() {
        self.init(
            dateTime: "",
            timeStamp: 0,
            countArticles: 0,
            articles: [Articles]()
        )
    }
}

extension CovidNews: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        dateTime <- map["datetime"]
        timeStamp <- map["timestamp"]
        countArticles <- map["countArticles"]
        articles <- map["articles"]
    }
}

struct Articles {
    var articlesUrl: String
    var title: String
    var description: String
    var descriptionTag: String
    var publishedDateTime: String
    var publishedTimeStamp: String
    var imageUrl: String
    var sourceName: String
    var sourceUrl: String
    var sourceDomain: String
}

extension Articles {
    init() {
        self.init(
            articlesUrl: "",
            title: "",
            description: "",
            descriptionTag: "",
            publishedDateTime: "",
            publishedTimeStamp: "",
            imageUrl: "",
            sourceName: "",
            sourceUrl: "",
            sourceDomain: ""
        )
    }
}

extension Articles: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        articlesUrl <- map["article_url"]
        title <- map["title"]
        description <- map["description"]
        descriptionTag <- map["description_with_tag"]
        publishedDateTime <- map["published_datetime"]
        publishedTimeStamp <- map["published_timestamp"]
        imageUrl <- map["image_url"]
        sourceName <- map["source_name"]
        sourceUrl <- map["source_url"]
        sourceDomain <- map["source_domain"]
    }
}
