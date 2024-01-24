//
//  OrderPaidView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 27.12.23..
//

import UIKit

protocol OrderPaidViewDelegate: AnyObject {
    func closeDeal()
}

final class OrderPaidView: UIView {
    
    private weak var delegate: OrderPaidViewDelegate?
    
    //MARK: Properties
    
    private lazy var backgroundImageView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 47
        $0.clipsToBounds = true
        $0.backgroundColor = .backgroundImageViewColor
        return $0
    }(UIView())
    
    private lazy var partyPopperImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .partyPopperImage
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.textAlignment = .center
        return $0
    }(UILabel(text: "Ваш заказ принят в работу", state: .titleLabel))
    
    private lazy var orderDescriptionLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .mainSecondaryTextColor
        return $0
    }(UILabel(text: "Подтверждение заказа №\(Int.random(in: 1..<1000)) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.", state: .descriptionLabel))
    
    private lazy var lineView = UIView().lineViewTabBar
    
    private lazy var blueButton = CustomBlueButton(
        title: "Супер!",
        titleColor: .buttonTextColor,
        backgroundColor: .buttonColor) {
            self.delegate?.closeDeal()
        }
    
    //MARK: Initial
    
    init(delegate: OrderPaidViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .backgroundViewOrCellColor
        self.setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.backgroundImageView)
        self.backgroundImageView.addSubview(self.partyPopperImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.orderDescriptionLabel)
        self.addSubview(self.lineView)
        self.addSubview(self.blueButton)
        
        NSLayoutConstraint.activate([
            self.backgroundImageView.heightAnchor.constraint(equalToConstant: 94),
            self.backgroundImageView.widthAnchor.constraint(equalToConstant: 94),
            self.backgroundImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 122),
            self.backgroundImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.partyPopperImageView.heightAnchor.constraint(equalToConstant: 44),
            self.partyPopperImageView.widthAnchor.constraint(equalToConstant: 44),
            self.partyPopperImageView.centerYAnchor.constraint(equalTo: self.backgroundImageView.centerYAnchor),
            self.partyPopperImageView.centerXAnchor.constraint(equalTo: self.backgroundImageView.centerXAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundImageView.bottomAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            self.orderDescriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.orderDescriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 23),
            self.orderDescriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -23),
            
            self.lineView.bottomAnchor.constraint(equalTo: self.blueButton.topAnchor, constant: -12),
            self.lineView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            self.blueButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.blueButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.blueButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6),
        ])
    }
}
