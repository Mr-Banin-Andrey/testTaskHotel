//
//  TagCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.1.24..
//

import UIKit

final class TagCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let reuseID = "TagCellID"
    
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .nameTileFont
        $0.textColor = .mainSecondaryTextColor
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .tileBackgroundColor
        self.contentView.layer.cornerRadius = 5
        self.contentView.clipsToBounds = true
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    func setupCell(_ info: String) {
        self.titleLabel.text = info
    }
    
    private func setupUI() {
        self.contentView.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
        ])
    }
}
