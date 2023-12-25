//
//  UIColor.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

extension UIColor {
    
    //MARK: AdvantaresView
    
    class var tileBackgroundColor: UIColor {
        UIColor(named: "tileBackgroundColor") ?? white
    }
    
    //MARK: DescriptionHotelCell ServiceStack
    
    class var serviceStackColor: UIColor {
        UIColor(named: "serviceStackColor") ?? lightGray
    }
    
    class var lineServiceColor: UIColor {
        UIColor(named: "lineServiceColor") ?? lightGray
    }
    
    //MARK: Main
    
    class var mainTextColor: UIColor {
        UIColor(named: "mainTextColor") ?? black
    }
    
    class var mainSecondaryTextColor: UIColor {
        UIColor(named: "mainSecondaryTextColor") ?? gray
    }
    
    class var backgroundViewOrCellColor: UIColor {
        UIColor(named: "backgroundViewOrCellColor") ?? white
    }
    
    class var lineViewTabBarColor: UIColor {
        UIColor(named: "lineViewTabBarColor") ?? lightGray
    }
    
    //MARK: MainBlueButton
    
    class var buttonColor: UIColor {
        UIColor(named: "buttonColor") ?? blue
    }
    
    class var buttonTextColor: UIColor {
        UIColor(named: "buttonTextColor") ?? white
    }
    
    //MARK: NameHotelAndLocationView
    
    class var ratingBackgroungColor: UIColor {
        UIColor(named: "ratingBackgroungColor") ?? yellow
    }
    
    class var ratingTextColor: UIColor {
        UIColor(named: "ratingTextColor") ?? orange
    }
    
    class var locationTextColor: UIColor {
        UIColor(named: "locationTextColor") ?? blue
    }
    
    //MARK: RoomCell
    
    class var detailAboutRoomTextColor: UIColor {
        UIColor(named: "detailAboutRoomTextColor") ?? blue
    }
    
    class var detailAboutRoomBackgroundColor: UIColor {
        UIColor(named: "detailAboutRoomBackgroundColor") ?? cyan
    }
    
    //MARK: TableView
    
    class var tableViewBackgroundColor: UIColor {
        UIColor(named: "tableViewBackgroundColor") ?? lightGray
    }
}
