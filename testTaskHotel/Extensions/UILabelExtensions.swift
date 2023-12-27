//
//  UILabelExtensions.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

extension UILabel {
    
    enum State {
        case titleLabel
        case descriptionLabel
        case forReservationLabel
    }
    
    convenience init(text: String? = nil, state: State) {
        self.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        
        switch state {
        case .titleLabel:
            self.font = .titleFont
            self.textColor = .mainTextColor

        case .descriptionLabel:
            self.font = .descriptionFont
            self.textColor = .mainTextColor
            self.numberOfLines = 0
            self.textAlignment = .left
            
        case .forReservationLabel:
            self.font = .descriptionFont
            self.textColor = .mainSecondaryTextColor
        }
    }
}

