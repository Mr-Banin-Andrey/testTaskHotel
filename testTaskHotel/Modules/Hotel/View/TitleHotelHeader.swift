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
    
    func setupHeader(_ images: [UIImage]) {
        self.galleryPhoto.setup(images)
        self.nameHotel.setupData()
        self.price.setupView(.ruble)
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundHeader)
        self.backgroundHeader.addSubview(self.galleryPhoto)
        self.backgroundHeader.addSubview(self.nameHotel)
        self.backgroundHeader.addSubview(self.price)
        
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
            
            self.price.topAnchor.constraint(equalTo: self.nameHotel.bottomAnchor, constant: 0),
            self.price.leadingAnchor.constraint(equalTo: self.backgroundHeader.leadingAnchor, constant: 16),
            self.price.trailingAnchor.constraint(equalTo: self.backgroundHeader.trailingAnchor, constant: -16),
            self.price.bottomAnchor.constraint(equalTo: self.backgroundHeader.bottomAnchor, constant: -16),
        ])
    }
}
