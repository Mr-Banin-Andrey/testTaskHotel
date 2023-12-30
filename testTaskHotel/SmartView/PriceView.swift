//
//  PriceView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 24.12.23..
//

import UIKit

final class PriceView: UIView {
    
    enum Сurrency: String {
        case dollar = "$"
        case euro = "€"
        case ruble = "₽"
    }
    
    //MARK: Properties
    
    private lazy var priceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .priceFont
        $0.textColor = .mainTextColor
        return $0
    }(UILabel())
    
    private lazy var currencyLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .priceFont
        $0.textColor = .mainTextColor
        return $0
    }(UILabel())
    
    private lazy var priceDescriptionLabel = UILabel(state: .forReservationLabel)
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupView(_ price: String, _ description: String, _ currency: Сurrency) {
        self.priceLabel.text = price
        self.currencyLabel.text = currency.rawValue
        self.priceDescriptionLabel.text = description
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.priceLabel)
        self.addSubview(self.currencyLabel)
        self.addSubview(self.priceDescriptionLabel)
        
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            self.currencyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.currencyLabel.leadingAnchor.constraint(equalTo: self.priceLabel.trailingAnchor, constant: 6),
            
            self.priceDescriptionLabel.leadingAnchor.constraint(equalTo: self.currencyLabel.trailingAnchor, constant: 8),
            self.priceDescriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
    
}
