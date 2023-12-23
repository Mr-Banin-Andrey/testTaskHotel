//
//  ImageCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.12.23..
//

import UIKit

final class ImageCell: UICollectionViewCell {
    
    static let reuseID = "ImageCellID"
    
    //MARK: Properties
    
    private lazy var pictureImage1: UIImageView = {
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.contentMode = .scaleToFill
         $0.layer.cornerRadius = 15
         $0.clipsToBounds = true
         return $0
    }(UIImageView())
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ picture: UIImage) {
        self.pictureImage1.image = picture
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.pictureImage1.image = nil
    }
    
    private func setupUI() {
        self.contentView.addSubview(self.pictureImage1)

        NSLayoutConstraint.activate([
            self.pictureImage1.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.pictureImage1.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.pictureImage1.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.pictureImage1.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
        ])
    }
}
