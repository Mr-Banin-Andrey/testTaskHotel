//
//  TitleHotelHeader.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

//MARK: - TitleHotelHeader

final class TitleHotelHeader: UITableViewHeaderFooterView {
    static let reuseID = "TitleHotelHeaderID"
    
    //MARK: Properties
    
    private var mockImages: [UIImage] = [._1, ._2, ._3, ._4, ._5,._1, ._2, ._3, ._4, ._5,._1, ._2, ._3, ._4, ._5,._1, ._2, ._3, ._4,]
    
    private lazy var backgroundHeader = UIView().backgroundViewCell
    private lazy var galleryPhoto = GalleryPhotoView(images: mockImages)
    private lazy var nameHotel = NameHotelAndLocationView()
    
    private lazy var priceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .priceFont
        $0.textColor = .mainTextColor
        $0.text = "от 134 500 ₽"
        return $0
    }(UILabel())
    
    private lazy var priceDescriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .descriptionFont
        $0.textColor = .textTertiaryColorColor
        $0.text = "за тур с перелётом"
        return $0
    }(UILabel())
    
    //MARK: Initial
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundHeader)
        self.backgroundHeader.addSubview(self.galleryPhoto)
        self.backgroundHeader.addSubview(self.nameHotel)
        self.backgroundHeader.addSubview(self.priceLabel)
        self.backgroundHeader.addSubview(self.priceDescriptionLabel)
        
        NSLayoutConstraint.activate([
            self.backgroundHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: -10),
            self.backgroundHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.backgroundHeader.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            self.backgroundHeader.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
                        
            self.galleryPhoto.topAnchor.constraint(equalTo: self.backgroundHeader.topAnchor, constant: 10),
            self.galleryPhoto.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor, constant: 0),
            self.galleryPhoto.trailingAnchor.constraint(equalTo: self.backgroundHeader.trailingAnchor, constant: 0),
            
            self.nameHotel.topAnchor.constraint(equalTo: self.galleryPhoto.bottomAnchor, constant: 0),
            self.nameHotel.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor, constant: 0),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.nameHotel.bottomAnchor, constant: 0),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor, constant: 16),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.backgroundHeader.bottomAnchor, constant: -16),
            
            self.priceDescriptionLabel.leadingAnchor.constraint(equalTo: self.priceLabel.trailingAnchor, constant: 8),
            self.priceDescriptionLabel.bottomAnchor.constraint(equalTo: self.backgroundHeader.bottomAnchor, constant: -16),
        ])
    }
}
