//
//  RoomCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.12.23..
//

import UIKit
import TTGTags

final class RoomCell: UITableViewCell {
    
    static let reuseID = "RoomCellID"
    
    var tapAction: ((String) -> Void)?
    
    //MARK: Properties
    
    private lazy var backgroundCell = UIView().backgroundViewCell
    
    private lazy var galleryPhotoRoomView = GalleryPhotoView()
    
    private lazy var titleRoomLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .mainTextColor
        $0.font = .titleFont
        $0.text = "Стандартный с видом на бассейн или сад"
        $0.numberOfLines = 2
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
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
        backgroundColor: .buttonColor,
        action: actionButton
    )
    
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
    
    func setupCell(_ images: [UIImage], _ advantages: [String]) {
        self.galleryPhotoRoomView.setup(images)
//        self.titleRoomLabel.text =
        self.advantagesRoomView.setupAdvantages(advantages)
        self.priceView.setupView(.ruble)
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundCell)
        self.backgroundCell.addSubview(self.galleryPhotoRoomView)
        self.backgroundCell.addSubview(self.titleRoomLabel)
        self.backgroundCell.addSubview(self.advantagesRoomView)
        self.backgroundCell.addSubview(self.detailAboutRoomStackView)
        self.detailAboutRoomStackView.addArrangedSubview(descriptionLabel)
        self.detailAboutRoomStackView.addArrangedSubview(arrowImage)
        
        self.backgroundCell.addSubview(self.priceView)
        self.backgroundCell.addSubview(self.selectHotelButton)
        
        NSLayoutConstraint.activate([
            self.backgroundCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backgroundCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.backgroundCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            self.backgroundCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            
            self.galleryPhotoRoomView.topAnchor.constraint(equalTo: self.backgroundCell.topAnchor, constant: 16),
            self.galleryPhotoRoomView.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 0),
            self.galleryPhotoRoomView.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: 0),
            
            self.titleRoomLabel.topAnchor.constraint(equalTo: self.galleryPhotoRoomView.bottomAnchor, constant: 8),
            self.titleRoomLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.titleRoomLabel.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.advantagesRoomView.topAnchor.constraint(equalTo: self.titleRoomLabel.bottomAnchor, constant: 8),
            self.advantagesRoomView.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.advantagesRoomView.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            self.advantagesRoomView.heightAnchor.constraint(equalToConstant: 35),
            
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
    
    //MARK: objc methods
    
    @objc private func actionButton() {
        tapAction?("word")
    }
}
