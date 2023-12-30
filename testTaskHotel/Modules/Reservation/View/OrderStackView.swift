//
//  OrderStackView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

final class OrderStackView: UIView {
    
    //MARK: Properties
    
    private lazy var mainStack = UIStackView().mainStack
    
    private lazy var departureStack = UIStackView().orderStackView
    private lazy var departureTitleLabel = UILabel(text: "Вылет из", state: .forReservationLabel)
    private lazy var departureValueLabel = UILabel(state: .descriptionLabel)
    
    private lazy var countryStack = UIStackView().orderStackView
    private lazy var countryTitleLabel = UILabel(text: "Страна, город", state: .forReservationLabel)
    private lazy var countryValueLabel = UILabel(state: .descriptionLabel)
    
    private lazy var dateStack = UIStackView().orderStackView
    private lazy var dateTitleLabel = UILabel(text: "Даты", state: .forReservationLabel)
    private lazy var dateValueLabel = UILabel(state: .descriptionLabel)
    
    private lazy var countNightStack = UIStackView().orderStackView
    private lazy var countNightTitleLabel = UILabel(text: "Кол-во ночей", state: .forReservationLabel)
    private lazy var countNightValueLabel = UILabel(state: .descriptionLabel)
    
    private lazy var hotelStack = UIStackView().orderStackView
    private lazy var hotelTitleLabel = UILabel(text: "Отель", state: .forReservationLabel)
    private lazy var hotelValueLabel = UILabel(state: .descriptionLabel)
    
    private lazy var roomStack = UIStackView().orderStackView
    private lazy var roomTitleLabel = UILabel(text: "Номер", state: .forReservationLabel)
    private lazy var roomValueLabel = UILabel(state: .descriptionLabel)
    
    private lazy var nutritionStack = UIStackView().orderStackView
    private lazy var nutritionTitleLabel = UILabel(text: "Питание", state: .forReservationLabel)
    private lazy var nutritionValueLabel = UILabel(state: .descriptionLabel)
    
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
    
    func setupStack(model: ReservationModelDecodable) {
        
        self.departureValueLabel.text = model.departure
        self.countryValueLabel.text = model.arrivalCountry
        self.dateValueLabel.text = "\(model.tourDateStart) – \(model.tourDateStop)"
        self.countNightValueLabel.text = "\(model.numberOfNights) ночей"
        self.hotelValueLabel.text = model.hotelName
        self.roomValueLabel.text = model.room
        self.nutritionValueLabel.text = model.nutrition
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        let constant = UIScreen.main.bounds.width / 2.38
        
        self.addSubview(self.mainStack)
        
        self.mainStack.addArrangedSubview(self.departureStack)
        self.departureStack.addArrangedSubview(self.departureTitleLabel)
        self.departureStack.addArrangedSubview(self.departureValueLabel)
        
        self.mainStack.addArrangedSubview(self.countryStack)
        self.countryStack.addArrangedSubview(self.countryTitleLabel)
        self.countryStack.addArrangedSubview(self.countryValueLabel)
        
        self.mainStack.addArrangedSubview(self.dateStack)
        self.dateStack.addArrangedSubview(self.dateTitleLabel)
        self.dateStack.addArrangedSubview(self.dateValueLabel)
        
        self.mainStack.addArrangedSubview(self.countNightStack)
        self.countNightStack.addArrangedSubview(self.countNightTitleLabel)
        self.countNightStack.addArrangedSubview(self.countNightValueLabel)
        
        self.mainStack.addArrangedSubview(self.hotelStack)
        self.hotelStack.addArrangedSubview(self.hotelTitleLabel)
        self.hotelStack.addArrangedSubview(self.hotelValueLabel)
        
        self.mainStack.addArrangedSubview(self.roomStack)
        self.roomStack.addArrangedSubview(self.roomTitleLabel)
        self.roomStack.addArrangedSubview(self.roomValueLabel)
        
        self.mainStack.addArrangedSubview(self.nutritionStack)
        self.nutritionStack.addArrangedSubview(self.nutritionTitleLabel)
        self.nutritionStack.addArrangedSubview(self.nutritionValueLabel)
        
        NSLayoutConstraint.activate([
            self.mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.departureValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
            self.countryValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
            self.dateValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
            self.countNightValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
            self.hotelValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
            self.roomValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
            self.nutritionValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant),
        ])
    }
}
