//
//  UIViewExtensions.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 20.12.23..
//

import UIKit

extension UIView {
    
    var backgroundViewCell: UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .backgroundViewOrCellColor
        self.layer.cornerRadius = 12
        return self
    }
    
    var lineViewTabBar: UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lineViewTabBarColor
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return self
    }
    
    var underLineServiceView: UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lineServiceColor
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return self
    }
    
}
