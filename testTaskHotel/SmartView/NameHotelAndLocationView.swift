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
        $0.distribution = .equalSpacing
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
    
    private lazy var titleLabel: UILabel = {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel(state: .titleLabel))
    
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
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupData(rating: Int, descriptionRating: String, nameHotel: String, location: String) {
        self.numberLabel.text = String(rating)
        self.descriptionLabel.text = descriptionRating
        self.titleLabel.text = nameHotel
        self.locationLabel.text = location
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.ratingHotelStackView)
        self.ratingHotelStackView.addArrangedSubview(starImage)
        self.ratingHotelStackView.addArrangedSubview(numberLabel)
        self.ratingHotelStackView.addArrangedSubview(descriptionLabel)
        self.addSubview(self.titleLabel)
        self.addSubview(self.locationLabel)
        
        NSLayoutConstraint.activate([
            self.starImage.heightAnchor.constraint(equalToConstant: 15),
            self.starImage.widthAnchor.constraint(equalToConstant: 15),
            
            self.ratingHotelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.ratingHotelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.ratingHotelStackView.bottomAnchor, constant: 8),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.locationLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.locationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}
