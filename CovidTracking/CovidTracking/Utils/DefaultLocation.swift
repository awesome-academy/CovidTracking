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

    static let defaulLocation: [Details] = [
        Vietnam,
        Us,
        India,
        Brazin
    ]
    
    static let articles = Articles(articlesUrl: "",
                            title: "Cập nhật dịch Covid-19 ngày 24-5: 187 ca mắc mới",
                            description: "Cập nhật dịch Covid-19 ngày 24-5: 187 ca mắc mới  Nhân DânSáng 25-5: Thêm 57 ca mắc COVID-19 mới, Hà Nội dừng hoạt động nhà hàng, cắt tóc...  Tuổi Trẻ OnlineTin tức Covid-19 sáng hôm nay 25/5: Thêm 57 ca Covid-19 trong nước, Bắc Giang vẫn tiếp tục tăng mạnh  Vietnamnet.vnTối 24/5: Thêm 95 ca mắc COVID-19 trong nước, Bắc Giang và Bắc Ninh chiếm 77 ca - Hoạt động của địa phương - Cổng thông tin Bộ Y tế  Bộ Y tếNhật ký Covid-19 sáng 25-5: Thêm 57 ca mắc Covid-19 tại Bắc Giang và 4 địa phương khác đều trong khu phong tỏa, cách ly  Báo điện tử Quân đội nhân dânXem Thông tin toàn cảnh trên Google Tin tức",
                            descriptionTag: "",
                            publishedDateTime: "2021-05-24T00:09:00+00:00",
                            publishedTimeStamp: "",
                            imageUrl: "https://www.coe.int/documents/16695/63022230/shutterstock_1161779020.jpg/3f9b522b-2d4c-b7cd-d91e-72fcb3b2069e",
                            sourceName: "",
                            sourceUrl: "",
                            sourceDomain: "")
    
    static let mockNews = [articles,
                           articles,
                           articles,
                           articles,
                           articles]
}
