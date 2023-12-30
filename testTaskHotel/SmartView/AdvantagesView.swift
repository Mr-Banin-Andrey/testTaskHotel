//
//  AdvantagesView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 24.12.23..
//

import UIKit
import TTGTags

final class AdvantagesView: UIView {
    
    //MARK: Properties
    
    private lazy var advantagesCollectionView: TTGTextTagCollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .left
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(TTGTextTagCollectionView(frame: .zero))
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupAdvantages(_ advantages: [String]) {
        print("count", advantages.count)
        advantages.forEach { advantage in
            let textTagContent = TTGTextTagStringContent(text: advantage)
            textTagContent.textFont = .nameTileFont
            textTagContent.textColor = .mainSecondaryTextColor

            let style = TTGTextTagStyle()
            style.shadowOpacity = 0
            style.extraSpace = CGSize(width: 10, height: 5)
            style.backgroundColor = .tileBackgroundColor
            style.cornerRadius = 5
            
            let tag = TTGTextTag(content: textTagContent, style: style)
            advantagesCollectionView.addTag(tag)
        }
        self.advantagesCollectionView.reload()
        self.advantagesCollectionView.layoutIfNeeded()
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.advantagesCollectionView)
        
        NSLayoutConstraint.activate([
            self.advantagesCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.advantagesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.advantagesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomAnchor.constraint(greaterThanOrEqualTo: advantagesCollectionView.bottomAnchor, constant: 4),
        ])
    }
}
