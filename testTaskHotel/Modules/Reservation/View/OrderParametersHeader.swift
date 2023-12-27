//
//  OrderParametersHeader.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

final class OrderParametersHeader: UITableViewHeaderFooterView {
    
    static let reuseID = "OrderParametersHeaderID"
    
    //MARK: Properties
    
    private lazy var backgroundViewNameHotel = UIView().backgroundViewCell
    private lazy var nameHotel = NameHotelAndLocationView()
    
    private lazy var orderStack = OrderStackView()
    
    private lazy var buyerInformationBackgroundView = UIView().backgroundViewCell
    private lazy var buyerTitle = UILabel(text: "Информация о покупателе", state: .titleLabel)
    private lazy var buyerStack = UIStackView().dataStackView
    
    private lazy var numberTextField = CustomTextField(titleOrPlaceholder: "Номер телефона", mode: .onlyPlaceholder, keyboardType: .phonePad)
    private lazy var emailTextField = CustomTextField(titleOrPlaceholder: "Почта", mode: .onlyPlaceholder, keyboardType: .emailAddress)
    
    private lazy var informationForBuyerLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .informationForBuyerFont
        $0.textColor = .mainSecondaryTextColor
        $0.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    //MARK: Initial
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Public methods
    
    func setupHeader() {
        self.nameHotel.setupData()
        self.orderStack.setupStack()
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundViewNameHotel)
        self.backgroundViewNameHotel.addSubview(self.nameHotel)
        self.contentView.addSubview(self.orderStack)
        
        self.contentView.addSubview(self.buyerInformationBackgroundView)
        self.buyerInformationBackgroundView.addSubview(self.buyerTitle)
        self.buyerInformationBackgroundView.addSubview(self.buyerStack)
        self.buyerStack.addArrangedSubview(self.numberTextField)
        self.buyerStack.addArrangedSubview(self.emailTextField)
        self.buyerStack.addArrangedSubview(self.informationForBuyerLabel)
        
        NSLayoutConstraint.activate([
            self.backgroundViewNameHotel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.backgroundViewNameHotel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundViewNameHotel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ///
//            self.backgroundViewNameHotel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.nameHotel.topAnchor.constraint(equalTo: self.backgroundViewNameHotel.topAnchor),
            self.nameHotel.leadingAnchor.constraint(equalTo: self.backgroundViewNameHotel.leadingAnchor),
            self.nameHotel.trailingAnchor.constraint(equalTo: self.backgroundViewNameHotel.trailingAnchor),
            self.nameHotel.bottomAnchor.constraint(equalTo: self.backgroundViewNameHotel.bottomAnchor),
            
            self.orderStack.topAnchor.constraint(equalTo: self.backgroundViewNameHotel.bottomAnchor, constant: 8),
            self.orderStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.orderStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            self.buyerInformationBackgroundView.topAnchor.constraint(equalTo: self.orderStack.bottomAnchor, constant: 8),
            
//            self.buyerInformationBackgroundView.topAnchor.constraint(equalTo: self.backgroundViewNameHotel.bottomAnchor, constant: 8),
            self.buyerInformationBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.buyerInformationBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.buyerInformationBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            
            self.buyerTitle.topAnchor.constraint(equalTo: self.buyerInformationBackgroundView.topAnchor, constant: 16),
            self.buyerTitle.leadingAnchor.constraint(equalTo: self.buyerInformationBackgroundView.leadingAnchor, constant: 16),
            self.buyerTitle.trailingAnchor.constraint(equalTo: self.buyerInformationBackgroundView.trailingAnchor, constant: -16),
            
            self.buyerStack.topAnchor.constraint(equalTo: self.buyerTitle.bottomAnchor, constant: 20),
            self.buyerStack.leadingAnchor.constraint(equalTo: self.buyerInformationBackgroundView.leadingAnchor, constant: 16),
            self.buyerStack.trailingAnchor.constraint(equalTo: self.buyerInformationBackgroundView.trailingAnchor, constant: -16),
            self.buyerStack.bottomAnchor.constraint(equalTo: self.buyerInformationBackgroundView.bottomAnchor, constant: -16),
        ])
    }
}
