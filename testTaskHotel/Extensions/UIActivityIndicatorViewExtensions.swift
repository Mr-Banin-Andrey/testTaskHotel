//
//  UIActivityIndicatorViewExtensions.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 30.12.23..
//

import UIKit

extension UIActivityIndicatorView {
    var activityIndicatorView: UIActivityIndicatorView{
        self.style = .large
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
