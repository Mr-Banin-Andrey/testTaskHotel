//
//  ServiceModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 22.12.23..
//

import UIKit

struct ServiceModel {
    let image: UIImage
    let title: String
    let explanation: String
}

extension ServiceModel {
    static let сomfort = ServiceModel(image: .emojiHappyImage, title: "Удобства", explanation: "Самое необходимое")
    static let whatIsIncluded = ServiceModel(image: .tickSquareImage, title: "Что включено", explanation: "Самое необходимое")
    static let whatIsNotIncluded = ServiceModel(image: .closeSquareImage, title: "Что не включено", explanation: "Самое необходимое")
}
