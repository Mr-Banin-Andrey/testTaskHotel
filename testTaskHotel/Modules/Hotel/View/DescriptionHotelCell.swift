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
    
    private lazy var advantagesArray: [String] = []
    
    private lazy var titleLabel = UILabel(text: "Об отеле", state: .titleLabel)
    
    private lazy var advantages = AdvantagesView()

    private lazy var descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        return $0
    }(UILabel(state: .descriptionLabel))
    
    private lazy var serviceStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .fill
        $0.backgroundColor = .serviceStackColor
        $0.layoutMargins = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layer.cornerRadius = 15
        return $0
    }(UIStackView())
    
    
    private lazy var сomfortCell = ServiceCellForStack(image: ServiceModel.сomfort.image,
                                               title: ServiceModel.сomfort.title,
                                               explanation: ServiceModel.сomfort.explanation)
    
    private lazy var whatIsIncludedCell = ServiceCellForStack(image: ServiceModel.whatIsIncluded.image,
                                                      title: ServiceModel.whatIsIncluded.title,
                                                      explanation: ServiceModel.whatIsIncluded.explanation)
    
    private lazy var whatIsNotIncludedCell = ServiceCellForStack(image: ServiceModel.whatIsNotIncluded.image,
                                                         title: ServiceModel.whatIsNotIncluded.title,
                                                         explanation: ServiceModel.whatIsNotIncluded.explanation)
    
    private lazy var firstLine = UIView().underLineServiceView
    private lazy var secondLine = UIView().underLineServiceView
    
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
    
    func setupCell(_ text: String, _ advantages: [String]) {
        self.descriptionLabel.text = text
        self.advantages.setupAdvantages(advantages)
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundCell)
        self.backgroundCell.addSubview(self.titleLabel)
        self.backgroundCell.addSubview(self.advantages)
        self.backgroundCell.addSubview(self.descriptionLabel)
        
        self.backgroundCell.addSubview(self.serviceStack)
        self.serviceStack.addArrangedSubview(self.сomfortCell)
        self.serviceStack.addArrangedSubview(self.whatIsIncludedCell)
        self.serviceStack.addArrangedSubview(self.whatIsNotIncludedCell)
        self.backgroundCell.addSubview(self.firstLine)
        self.backgroundCell.addSubview(self.secondLine)
        
        NSLayoutConstraint.activate([
            self.backgroundCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backgroundCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.backgroundCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            self.backgroundCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundCell.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            
            self.advantages.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.advantages.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.advantages.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            self.advantages.heightAnchor.constraint(equalToConstant: 70),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.advantages.bottomAnchor, constant: 12),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.serviceStack.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.serviceStack.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            self.serviceStack.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            self.serviceStack.bottomAnchor.constraint(equalTo: self.backgroundCell.bottomAnchor, constant: -16),
            
            self.firstLine.topAnchor.constraint(equalTo: self.сomfortCell.bottomAnchor, constant: 10),
            self.firstLine.leadingAnchor.constraint(equalTo: self.serviceStack.leadingAnchor, constant: 53),
            self.firstLine.trailingAnchor.constraint(equalTo: self.serviceStack.trailingAnchor, constant: -15),
            
            self.secondLine.topAnchor.constraint(equalTo: self.whatIsIncludedCell.bottomAnchor, constant: 10),
            self.secondLine.leadingAnchor.constraint(equalTo: self.serviceStack.leadingAnchor, constant: 53),
            self.secondLine.trailingAnchor.constraint(equalTo: self.serviceStack.trailingAnchor, constant: -15),
        ])
    }
}
