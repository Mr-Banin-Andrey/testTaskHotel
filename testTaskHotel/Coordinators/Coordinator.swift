//
//  Coordinator.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    
    func start()
}

protocol Coordinatable {
    
    var coordinator: Coordinator? { get set }
    
}
