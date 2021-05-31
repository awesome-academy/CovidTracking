//
//  EmergencyCallModel.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/28/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

struct Phone {
    let name: String
    let phoneNumber: String
}

struct EmergencyCall {
    static let phone: [Phone] = [
        Phone(name: "Đường dây nóng BYT",
              phoneNumber: "19003228"),
        Phone(name: "Đường dây nóng BYT",
              phoneNumber: "19009095"),
        Phone(name: "Bệnh viện Bạch Mai",
              phoneNumber: "0969851616"),
        Phone(name: "Bệnh viện Nhiệt đới Trung ương",
              phoneNumber: "0969241616"),
        Phone(name: "Bệnh viện E",
              phoneNumber: "0912168887"),
        Phone(name: "Bệnh viện Nhi Trung ương",
              phoneNumber: "0372884712"),
        Phone(name: "Bệnh viện Phổi Trung ương",
              phoneNumber: "0967941616"),
        Phone(name: "Bệnh viện Việt Nam - Thuỵ Điển Uông Bí",
              phoneNumber: "0966681313"),
        Phone(name: "Bệnh viện Đa khoa Trung ương Thái Nguyên",
              phoneNumber: "0913394495"),
        Phone(name: "Bệnh viện Đa khoa Trung ương Huế",
              phoneNumber: "0945313999"),
        Phone(name: "Bệnh viện Đa khoa Trung ương Cần thơ",
              phoneNumber: "0907736736"),
        Phone(name: "Bệnh viện Xanh Pôn Hà Nội",
              phoneNumber: "0982414127"),
        Phone(name: "Bệnh viện Vinmec Hà Nội",
              phoneNumber: "0934472768"),
        Phone(name: "Bệnh viện Đà Nẵng",
              phoneNumber: "0903583881"),
        Phone(name: "Bệnh viện Nhiệt dới Thành Phố HCM",
              phoneNumber: "0967341010"),
        Phone(name: "Bệnh viện Nhi đồng 1",
              phoneNumber: "0913117965"),
        Phone(name: "Bệnh viện Nhi đồng 2",
              phoneNumber: "0978429841"),
        Phone(name: "Bệnh viện Đa khoa tỉnh Đồng Nai",
              phoneNumber: "0819634807"),
        Phone(name: "Bệnh viện Nhiệt đới Khánh Hoà",
              phoneNumber: "0913464257"),
        Phone(name: "Bệnh viện Đa khoa tỉnh Khánh Hoà",
              phoneNumber: "0913464257"),
        Phone(name: "Bệnh viện Đa khoa tỉnh Thái Bình",
              phoneNumber: "0989506516"),
        Phone(name: "Bệnh viện Đa khoa tỉnh Lạng Sơn",
              phoneNumber: "039680336"),
        Phone(name: "Bệnh viện Chợ Rẫy",
              phoneNumber: "0969871010")
    ]
}
