//
//  HotelModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation

struct HotelModelDecodable: Decodable {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let images: [String]
    let aboutTheHotel: AboutTheHotelDecodable

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address = "adress"
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case images = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

struct AboutTheHotelDecodable: Decodable {
    let description: String
    let peculiarities: [String]
}
