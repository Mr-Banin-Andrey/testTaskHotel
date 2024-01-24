//
//  RoomModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation

struct RoomsModelDecodable: Decodable {
    let rooms: [RoomModelDecodable]
}

struct RoomModelDecodable: Decodable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case pricePer = "price_per"
        case peculiarities
        case images = "image_urls"
    }
}
