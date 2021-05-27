//
//  DefaultLocation.swift
//  CovidTracking
//
//  Created by Tiến on 5/21/21.
//  Copyright © 2021 Tiến. All rights reserved.

import Foundation

struct DefaultLocation {

    //MARK: - Mock data
    
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
