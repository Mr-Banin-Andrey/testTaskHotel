//
//  HotelPhotosModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import Foundation

struct HotelPhotosModel {
    let photos: String
}

struct Photos {
    let photos: [HotelPhotosModel] = [
        HotelPhotosModel(photos: "1"),
        HotelPhotosModel(photos: "2"),
        HotelPhotosModel(photos: "3"),
        HotelPhotosModel(photos: "4"),
        HotelPhotosModel(photos: "5")
    ]
}
