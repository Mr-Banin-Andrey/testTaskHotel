//
//  DataConverter.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import Foundation
import UIKit.UIImage

protocol DataConverterProtocol: AnyObject {
    func hotelModelConvert(model: HotelModelDecodable, data: [Data]) -> HotelModel
    func roomModelConvert(model: RoomModelDecodable, data: [Data]) -> RoomModel
    
}

final class DataConverter {

}

extension DataConverter: DataConverterProtocol {
    
    func hotelModelConvert(model: HotelModelDecodable, data: [Data]) -> HotelModel {
        return HotelModel(
            id: model.id,
            name: model.name,
            address: model.address,
            minimalPrice: model.minimalPrice,
            priceForIt: model.priceForIt,
            rating: model.rating,
            ratingName: model.ratingName,
            images: data,
            aboutTheHotel: AboutTheHotel(description: model.aboutTheHotel.description, peculiarities: model.aboutTheHotel.peculiarities))
    }
    
    func roomModelConvert(model: RoomModelDecodable, data: [Data]) -> RoomModel {
        return RoomModel(id: model.id,
                         name: model.name,
                         price: model.price,
                         pricePer: model.pricePer,
                         peculiarities: model.peculiarities,
                         images: data)
    }
}
