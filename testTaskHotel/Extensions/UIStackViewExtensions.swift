//
//  UIStackViewExtensions.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

extension UIStackView {
    
    var orderStackView: UIStackView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.alignment = .firstBaseline
        return self
    }
    
    var dataStackView: UIStackView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 8
        self.axis = .vertical
        return self
    }
    
    var priceStackView: UIStackView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 16
        self.distribution = .fillEqually
        self.axis = .horizontal
        return self
    }
    
    var mainStack: UIStackView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 16
        self.axis = .vertical
        self.alignment = .fill
        self.backgroundColor = .backgroundViewOrCellColor
        self.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        self.isLayoutMarginsRelativeArrangement = true
        self.layer.cornerRadius = 12
        return self
    }
}
