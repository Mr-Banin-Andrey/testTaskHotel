//
//  HotelView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

//MARK: - HotelViewDelegate

protocol HotelViewDelegate: AnyObject {
    
}

//MARK: - HotelView

class HotelView: UIView {
    
    weak var delegate: HotelViewDelegate?
    
    //MARK: Initial
    
    init(delegate: HotelViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    
    
    //MARK: Private methods
    
    private func setupUI() {
        
    }
}
