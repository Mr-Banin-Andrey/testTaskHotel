//
//  FinalPriceAndAddTouristFooter.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

protocol FinalPriceAndAddTouristFooterDelegate: AnyObject {
    func addTourist()
}

final class FinalPriceAndAddTouristFooter: UITableViewHeaderFooterView {
    
    static let reuseID = "FinalPriceAndAddTouristFooterID"
    
    weak var delegate: FinalPriceAndAddTouristFooterDelegate?
    
    //MARK: Properties
    
    private lazy var backgroundAddTouristView = UIView().backgroundViewCell
    private lazy var titleAddTouristLabel = UILabel(text: "Добавить туриста", state: .titleLabel)
    
    private lazy var plusImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "plus.square.fill")
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .arrowTintColor
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
        
    private lazy var mainStack = UIStackView().mainStack
    private lazy var tourStackView = UIStackView().priceStackView
    private lazy var tourTitleLabel = UILabel(text: "Тур", state: .forReservationLabel)
    private lazy var tourValueLabel: UILabel = {
        $0.textAlignment = .right
        return $0
    }(UILabel(state: .descriptionLabel))
    
    private lazy var fuelSurchargeStackView = UIStackView().priceStackView
    private lazy var fuelSurchargeTitleLabel = UILabel(text: "Топливный сбор", state: .forReservationLabel)
    private lazy var fuelSurchargeValueLabel: UILabel = {
        $0.textAlignment = .right
        return $0
    }(UILabel(state: .descriptionLabel))
    
    private lazy var serviceFeeStackView = UIStackView().priceStackView
    private lazy var serviceFeeTitleLabel = UILabel(text: "Сервисный сбор", state: .forReservationLabel)
    private lazy var serviceFeeValueLabel: UILabel = {
        $0.textAlignment = .right
        return $0
    }(UILabel(state: .descriptionLabel))
    
    private lazy var toPayStackView = UIStackView().priceStackView
    private lazy var toPayTitleLabel = UILabel(text: "К оплате", state: .forReservationLabel)
    private lazy var toPayValueLabel: UILabel = {
        $0.textAlignment = .right
        $0.textColor = .finalPriceLabelColor
        $0.font = .finalPriceFont
        return $0
    }(UILabel(state: .descriptionLabel))
    
    //MARK: Initial
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
        self.setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupFooter() {
        self.tourValueLabel.text = "186 600 ₽"
        self.fuelSurchargeValueLabel.text = "9 300 ₽"
        self.serviceFeeValueLabel.text = "2 136 ₽"
        self.toPayValueLabel.text = "198 036 ₽"
    }
    
    //MARK: Private methods
    
    private func setupGestures() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addTouristCell))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.plusImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundAddTouristView)
        self.backgroundAddTouristView.addSubview(self.titleAddTouristLabel)
        self.backgroundAddTouristView.addSubview(self.plusImage)
        
        self.contentView.addSubview(self.mainStack)
        
        self.mainStack.addArrangedSubview(self.tourStackView)
        self.tourStackView.addArrangedSubview(self.tourTitleLabel)
        self.tourStackView.addArrangedSubview(self.tourValueLabel)
        
        self.mainStack.addArrangedSubview(self.fuelSurchargeStackView)
        self.fuelSurchargeStackView.addArrangedSubview(self.fuelSurchargeTitleLabel)
        self.fuelSurchargeStackView.addArrangedSubview(self.fuelSurchargeValueLabel)
        
        self.mainStack.addArrangedSubview(self.serviceFeeStackView)
        self.serviceFeeStackView.addArrangedSubview(self.serviceFeeTitleLabel)
        self.serviceFeeStackView.addArrangedSubview(self.serviceFeeValueLabel)
        
        self.mainStack.addArrangedSubview(self.toPayStackView)
        self.toPayStackView.addArrangedSubview(self.toPayTitleLabel)
        self.toPayStackView.addArrangedSubview(self.toPayValueLabel)
        
        NSLayoutConstraint.activate([
            self.backgroundAddTouristView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backgroundAddTouristView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundAddTouristView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            self.titleAddTouristLabel.topAnchor.constraint(equalTo: self.backgroundAddTouristView.topAnchor, constant: 16),
            self.titleAddTouristLabel.leadingAnchor.constraint(equalTo: self.backgroundAddTouristView.leadingAnchor, constant: 16),
            self.titleAddTouristLabel.bottomAnchor.constraint(equalTo: self.backgroundAddTouristView.bottomAnchor, constant: -16),
            
            self.plusImage.heightAnchor.constraint(equalToConstant: 32),
            self.plusImage.widthAnchor.constraint(equalToConstant: 32),
            self.plusImage.topAnchor.constraint(equalTo: self.backgroundAddTouristView.topAnchor, constant: 13),
            self.plusImage.trailingAnchor.constraint(equalTo: self.backgroundAddTouristView.trailingAnchor, constant: -16),
            
            self.mainStack.topAnchor.constraint(equalTo: self.backgroundAddTouristView.bottomAnchor, constant: 8),
            self.mainStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.mainStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.mainStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8),
        ])
    }
    
    //MARK: @objc private methods
    
    @objc private func addTouristCell(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.addTourist()
    }
}
