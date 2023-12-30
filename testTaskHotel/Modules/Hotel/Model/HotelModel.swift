//
//  HotelModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import Foundation

struct HotelModel {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    var images: [Data]
    let aboutTheHotel: AboutTheHotel
}

struct AboutTheHotel {
    let description: String
    let peculiarities: [String]
}
