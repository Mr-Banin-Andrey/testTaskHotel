//
//  RoomsModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import Foundation

struct RoomsModel {
    var rooms: [RoomModel]
}

struct RoomModel {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let images: [Data]
}
