//
//  ServiceCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 22.12.23..
//

import UIKit

final class ServiceCell: UITableViewCell {
    
    static let reuseID = "ServiceCellID"
    
    //MARK: Properties
    
    private lazy var serviceImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())
    
    private lazy var titleServiceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .nameTileFont
        $0.textColor = .mainTextColor
        return $0
    }(UILabel())
    
    private lazy var explanationLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .explanatoryTextFont
        $0.textColor = .textTertiaryColorColor
        return $0
    }(UILabel())
    
    private lazy var arrowImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "chevron.forward")
        $0.tintColor = .mainTextColor
        return $0
    }(UIImageView())
    
    private lazy var underLineView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lineServiceColor
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return $0
    }(UIImageView())
    
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
    
    func setupService(model: ServiceModel) {
        self.serviceImage.image = model.serviceImage
        self.titleServiceLabel.text = model.serviceTitle
        self.explanationLabel.text = model.serviceExplanation
    }
    
    func setupUnderline() {
        self.underLineView.isHidden = true
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.serviceImage)
        self.contentView.addSubview(self.titleServiceLabel)
        self.contentView.addSubview(self.explanationLabel)
        self.contentView.addSubview(self.arrowImage)
        self.contentView.addSubview(self.underLineView)
        
        NSLayoutConstraint.activate([
            self.contentView.heightAnchor.constraint(equalToConstant: 58),
            
            self.serviceImage.heightAnchor.constraint(equalToConstant: 24),
            self.serviceImage.widthAnchor.constraint(equalToConstant: 24),
            self.serviceImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.serviceImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            
            self.titleServiceLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.titleServiceLabel.leadingAnchor.constraint(equalTo: self.serviceImage.trailingAnchor, constant: 12),
            
            self.explanationLabel.topAnchor.constraint(equalTo: self.titleServiceLabel.bottomAnchor, constant: 2),
            self.explanationLabel.leadingAnchor.constraint(equalTo: self.serviceImage.trailingAnchor, constant: 12),
            
            self.arrowImage.heightAnchor.constraint(equalToConstant: 14),
            self.arrowImage.widthAnchor.constraint(equalToConstant: 8),
            self.arrowImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.arrowImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -22),
            
            self.underLineView.leadingAnchor.constraint(equalTo: self.serviceImage.trailingAnchor, constant: -10),
            self.underLineView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.underLineView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}
