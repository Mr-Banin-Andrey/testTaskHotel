//
//  DescriptionHotelCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 20.12.23..
//

import UIKit
import TTGTags

final class DescriptionHotelCell: UITableViewCell {
    
    static let reuseID = "DescriptionHotelCellID"
    
    //MARK: Properties
    
    private lazy var backgroundCell = UIView().backgroundViewCell
    
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .mainTextColor
        $0.font = .titleFont
        $0.text = "Об отеле"
        return $0
    }(UILabel())
    
    private lazy var advantagesHotel: TTGTextTagCollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .left
        return $0
    }(TTGTextTagCollectionView(frame: .zero))
    
    private lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .mainTextColor
        $0.font = .descriptionFont
        $0.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var tableService = ServicesView()
    
    private lazy var abs = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
    
    //MARK: Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.setupUI()
        self.setupAdvantagesHotel(abs)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundCell)
        self.backgroundCell.addSubview(self.titleLabel)
        self.backgroundCell.addSubview(self.advantagesHotel)
        self.backgroundCell.addSubview(self.descriptionLabel)
        self.backgroundCell.addSubview(self.tableService)
        
        NSLayoutConstraint.activate([
            self.backgroundCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backgroundCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.backgroundCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            self.backgroundCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundCell.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            
            self.advantagesHotel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.advantagesHotel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.advantagesHotel.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.advantagesHotel.bottomAnchor, constant: 12),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.tableService.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.tableService.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.tableService.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.backgroundCell.bottomAnchor.constraint(greaterThanOrEqualTo: tableService.bottomAnchor, constant: -16),
        ])
    }
    
    private func setupAdvantagesHotel(_ advantages: [String]) {
        for advantage in advantages {
            let textTagContent = TTGTextTagStringContent(text: advantage)
            textTagContent.textFont = .nameTileFont
            textTagContent.textColor = .textTertiaryColorColor

            let style = TTGTextTagStyle()
            style.shadowOpacity = 0
            style.extraSpace = CGSize(width: 10, height: 5)
            style.backgroundColor = .tileBackgroundColor
            style.cornerRadius = 5
            
            let tag = TTGTextTag(content: textTagContent, style: style)
            advantagesHotel.addTag(tag)
        }
        self.advantagesHotel.reload()
        self.advantagesHotel.layoutIfNeeded()
    }
}
