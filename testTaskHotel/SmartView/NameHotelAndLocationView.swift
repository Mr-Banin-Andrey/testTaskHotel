//
//  NameHotelAndLocationView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

final class NameHotelAndLocationView: UIView {
    
    // MARK: properties
    
    private lazy var ratingHotelStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 2
        $0.backgroundColor = .ratingBackgroungColor
        $0.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layer.cornerRadius = 5
        return $0
    }(UIStackView())
    
    private lazy var starImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "star.fill")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .ratingTextColor
        return $0
    }(UIImageView())
    
    private lazy var numberLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "5"
        $0.font = .nameTileFont
        $0.textColor = .ratingTextColor
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Превосходно"
        $0.font = .nameTileFont
        $0.textColor = .ratingTextColor
        return $0
    }(UILabel())
    
    private lazy var nameHotelLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Steigenberger Makadi"
        $0.font = .titleFont
        $0.textColor = .mainTextColor
        return $0
    }(UILabel())
    
    private lazy var locationLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        $0.font = .explanatoryTextFont
        $0.textColor = .locationTextColor
        return $0
    }(UILabel())
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupData() {
//        self.numberLabel.text = "4"
//        self.descriptionLabel.text = "cool"
//        
//        self.nameHotelLabel.text = "Punta cana"
//        self.locationLabel.text = "msk"
    }
    
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.ratingHotelStackView)
        self.ratingHotelStackView.addArrangedSubview(starImage)
        self.ratingHotelStackView.addArrangedSubview(numberLabel)
        self.ratingHotelStackView.addArrangedSubview(descriptionLabel)
        self.addSubview(self.nameHotelLabel)
        self.addSubview(self.locationLabel)
        
        NSLayoutConstraint.activate([
            self.starImage.heightAnchor.constraint(equalToConstant: 15),
            self.starImage.widthAnchor.constraint(equalToConstant: 15),
            
            self.ratingHotelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.ratingHotelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            self.nameHotelLabel.topAnchor.constraint(equalTo: self.ratingHotelStackView.bottomAnchor, constant: 8),
            self.nameHotelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            self.locationLabel.topAnchor.constraint(equalTo: self.nameHotelLabel.bottomAnchor, constant: 8),
            self.locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.locationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}
