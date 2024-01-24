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
    
    private lazy var backgroundHeader = UIView().backgroundViewCell
    private lazy var galleryPhoto = GalleryPhotoView()
    private lazy var nameHotel = NameHotelAndLocationView()
    private lazy var price = PriceView()
    
    //MARK: Initial
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been mplemented")
    }
    
    //MARK: Public methods
    
    func setupHeader(model: HotelModel) {
        self.galleryPhoto.setup(model.images.compactMap({ UIImage(data: $0) }))
        
        self.nameHotel.setupData(rating: model.rating, descriptionRating: model.ratingName, nameHotel: model.name, location: model.address)
        self.price.setupView(
            "от \(UsefulMethods().formatNumber(model.minimalPrice))",
            model.priceForIt,
                .ruble)
        
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundHeader)
        self.backgroundHeader.addSubview(self.galleryPhoto)
        self.backgroundHeader.addSubview(self.nameHotel)
        self.backgroundHeader.addSubview(self.price)
        
        NSLayoutConstraint.activate([
            self.backgroundHeader.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.backgroundHeader.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundHeader.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backgroundHeader.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                        
            self.galleryPhoto.topAnchor.constraint(equalTo: self.backgroundHeader.topAnchor, constant: 10),
            self.galleryPhoto.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor),
            self.galleryPhoto.trailingAnchor.constraint(equalTo: self.backgroundHeader.trailingAnchor),
            
            self.nameHotel.topAnchor.constraint(equalTo: self.galleryPhoto.bottomAnchor),
            self.nameHotel.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor),
            self.nameHotel.trailingAnchor.constraint(equalTo: self.backgroundHeader.trailingAnchor),
            
            self.price.topAnchor.constraint(equalTo: self.nameHotel.bottomAnchor),
            self.price.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor, constant: 16),
            self.price.trailingAnchor.constraint(equalTo: self.backgroundHeader.trailingAnchor, constant: -16),
            self.price.bottomAnchor.constraint(equalTo: self.backgroundHeader.bottomAnchor, constant: -16),
        ])
    }
}
