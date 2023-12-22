//
//  ServiceModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 22.12.23..
//

import UIKit

struct ServiceModel {
    let serviceImage: UIImage
    let serviceTitle: String
    let serviceExplanation: String
}

struct ArrayServices {
    let array = [
        ServiceModel(serviceImage: .emojiHappyImage, serviceTitle: "Удобства", serviceExplanation: "Самое необходимое"),
        ServiceModel(serviceImage: .tickSquareImage, serviceTitle: "Что включено", serviceExplanation: "Самое необходимое"),
        ServiceModel(serviceImage: .closeSquareImage, serviceTitle: "Что не включено", serviceExplanation: "Самое необходимое"),
    ]
}
//func setupService(model: ServiceModel) {
//    self.serviceImage.image =
//    self.titleServiceLabel.text =
//    self.explanationLabel.text =
//}
