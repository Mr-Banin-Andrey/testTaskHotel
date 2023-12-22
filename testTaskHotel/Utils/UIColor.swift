//
//  UIColor.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

extension UIColor {
    
    class var lineViewTabBarColor: UIColor {
        UIColor(named: "lineViewTabBarColor") ?? lightGray
    }
    
    class var lineServiceColor: UIColor {
        UIColor(named: "lineServiceColor") ?? lightGray
    }
        
    class var mainBackgroundColor: UIColor {
        UIColor(named: "mainBackgroundColor") ?? white
    }
    
    class var mainButtonColor: UIColor {
        UIColor(named: "mainButtonColor") ?? blue
    }
    
    class var textTertiaryColorColor: UIColor {
        UIColor(named: "tertiaryColor") ?? gray
    }
    
    class var ratingBackgroungColor: UIColor {
        UIColor(named: "ratingBackgroungColor") ?? yellow
    }
    
    class var ratingTextColor: UIColor {
        UIColor(named: "ratingTextColor") ?? orange
    }
    
    class var mainTextColor: UIColor {
        UIColor(named: "mainTextColor") ?? black
    }
    
    class var tableViewBackgroundColor: UIColor {
        UIColor(named: "tableViewBackgroundColor") ?? lightGray
    }
    
    class var tileBackgroundColor: UIColor {
        UIColor(named: "tileBackgroundColor") ?? white
    }
}
