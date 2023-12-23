//
//  ServiceCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 22.12.23..
//

import UIKit

final class ServiceCell: UIView {
    
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
    
    //MARK: Initial
    
    init(image: UIImage, title: String, explanation: String) {
        super.init(frame: .zero)
        self.serviceImage.image = image
        self.titleServiceLabel.text = title
        self.explanationLabel.text = explanation
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.serviceImage)
        self.addSubview(self.titleServiceLabel)
        self.addSubview(self.explanationLabel)
        self.addSubview(self.arrowImage)
        
        NSLayoutConstraint.activate([
            self.serviceImage.heightAnchor.constraint(equalToConstant: 24),
            self.serviceImage.widthAnchor.constraint(equalToConstant: 24),
            self.serviceImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.serviceImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            self.titleServiceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.titleServiceLabel.leadingAnchor.constraint(equalTo: self.serviceImage.trailingAnchor, constant: 12),
            
            self.explanationLabel.topAnchor.constraint(equalTo: self.titleServiceLabel.bottomAnchor, constant: 2),
            self.explanationLabel.leadingAnchor.constraint(equalTo: self.serviceImage.trailingAnchor, constant: 12),
            self.explanationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.arrowImage.heightAnchor.constraint(equalToConstant: 14),
            self.arrowImage.widthAnchor.constraint(equalToConstant: 8),
            self.arrowImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.arrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
        ])
    }
}
