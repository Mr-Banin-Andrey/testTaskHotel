//
//  UIFont.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 20.12.23..
//

import UIKit

extension UIFont {
    
    class var titleFont: UIFont {
        UIFont.systemFont(ofSize: 22, weight: .medium)
    }
    
    class var priceFont: UIFont {
        UIFont.systemFont(ofSize: 30, weight: .semibold)
    }
    
    class var descriptionFont: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    class var nameTileFont: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    class var explanatoryTextFont: UIFont {
        UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    class var informationForBuyerFont: UIFont {
        UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    class var finalPriceFont: UIFont {
        UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
}
