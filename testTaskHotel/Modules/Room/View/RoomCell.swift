//
//  RoomCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.12.23..
//

import UIKit

//MARK: - RoomCellDelegate

protocol RoomCellDelegate: AnyObject {
    func bookRoom()
}

//MARK: - RoomCell

final class RoomCell: UITableViewCell {
    
    static let reuseID = "RoomCellID"
    
    weak var delegate: RoomCellDelegate?
        
    //MARK: Properties
    
    private lazy var backgroundCell = UIView().backgroundViewCell
    private lazy var galleryPhotoRoomView = GalleryPhotoView()
    
    private lazy var titleLabel: UILabel = {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel(state: .titleLabel))
    
    private lazy var advantagesRoomView = AdvantagesView()
    
    private lazy var detailAboutRoomStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 2
        $0.backgroundColor = .detailAboutRoomBackgroundColor
        $0.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layer.cornerRadius = 5
        return $0
    }(UIStackView())
    
    private lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Подробнее о номере"
        $0.font = .nameTileFont
        $0.textColor = .detailAboutRoomTextColor
        return $0
    }(UILabel())
    
    private lazy var arrowImage: UIImageView = {
        let font = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "chevron.forward", withConfiguration: font.applying(font))
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .detailAboutRoomTextColor
        return $0
    }(UIImageView())
    
    private lazy var priceView = PriceView()
    
    private lazy var selectHotelButton = CustomBlueButton(
        title: "Выбрать номер",
        titleColor: .buttonTextColor,
        backgroundColor: .buttonColor) {
            self.delegate?.bookRoom()
        }
    
    private lazy var advantagesRoomViewheightAnchor35 = self.advantagesRoomView.heightAnchor.constraint(equalToConstant: 35)
    private lazy var advantagesRoomViewheightAnchor70 = self.advantagesRoomView.heightAnchor.constraint(equalToConstant: 70)
    
    //MARK: Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupCell(model: RoomModel) {
        self.galleryPhotoRoomView.setup(model.images.compactMap({ UIImage(data: $0) }))
        self.titleLabel.text = model.name
        self.advantagesRoomView.setup(model.peculiarities)
        self.priceView.setupView(UsefulMethods().formatNumber(model.price), model.pricePer, .ruble)
        
        if model.peculiarities.count > 2 {
            advantagesRoomViewheightAnchor70.isActive = true
        } else {
            advantagesRoomViewheightAnchor35.isActive = true
        }
    }    
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundCell)
        self.backgroundCell.addSubview(self.galleryPhotoRoomView)
        self.backgroundCell.addSubview(self.titleLabel)
        self.backgroundCell.addSubview(self.advantagesRoomView)
        self.backgroundCell.addSubview(self.detailAboutRoomStackView)
        self.detailAboutRoomStackView.addArrangedSubview(descriptionLabel)
        self.detailAboutRoomStackView.addArrangedSubview(arrowImage)
        
        self.backgroundCell.addSubview(self.priceView)
        self.backgroundCell.addSubview(self.selectHotelButton)
        
        NSLayoutConstraint.activate([
            self.backgroundCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backgroundCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backgroundCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            
            self.galleryPhotoRoomView.topAnchor.constraint(equalTo: self.backgroundCell.topAnchor, constant: 16),
            self.galleryPhotoRoomView.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor),
            self.galleryPhotoRoomView.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.galleryPhotoRoomView.bottomAnchor, constant: 8),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.advantagesRoomView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.advantagesRoomView.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.advantagesRoomView.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.arrowImage.heightAnchor.constraint(equalToConstant: 20),
            self.arrowImage.widthAnchor.constraint(equalToConstant: 20),
            
            self.detailAboutRoomStackView.topAnchor.constraint(equalTo: self.advantagesRoomView.bottomAnchor, constant: 8),
            self.detailAboutRoomStackView.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            
            self.priceView.topAnchor.constraint(equalTo: self.detailAboutRoomStackView.bottomAnchor, constant: 16),
            self.priceView.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.priceView.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.selectHotelButton.topAnchor.constraint(equalTo: self.priceView.bottomAnchor, constant: 16),
            self.selectHotelButton.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.selectHotelButton.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            self.selectHotelButton.bottomAnchor.constraint(equalTo: self.backgroundCell.bottomAnchor, constant: -16),
        ])
    }
}
