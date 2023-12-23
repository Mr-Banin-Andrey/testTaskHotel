//
//  HotelViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

//MARK: - HotelViewController

final class HotelViewController: UIViewController {
    
    private lazy var hotelView = HotelView(delegate: self)
    
    //MARK: Initial
    
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = hotelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Отель"
    }
}

//MARK: - HotelViewDelegate

extension HotelViewController: HotelViewDelegate {
    
}
