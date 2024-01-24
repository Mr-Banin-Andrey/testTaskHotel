//
//  AdvantagesView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.1.24..
//

import UIKit

final class AdvantagesView: UIView {
    
    //MARK: Properties
    
    private lazy var layout = TagsLayout()
    
    private lazy var collectionView: UICollectionView = {
        let layout = TagsLayout()
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(TagCell.self, forCellWithReuseIdentifier: TagCell.reuseID)
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.isScrollEnabled = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: self.layout))
    
    private var tagsArray: [String] = []
    
    //MARK: Initial
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    func setup(_ tags: [String]) {
        self.tagsArray = tags
        
        if tags.count == 3 {
            self.collectionView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        }
        if tags.count == 4 {
            self.collectionView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        }
        
        collectionView.reloadData()
    }

    private func setupUI() {
        self.addSubview(collectionView)
                
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension AdvantagesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseID, for: indexPath) as? TagCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
            return cell
        }
        
        cell.setupCell(tagsArray[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension AdvantagesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0, height: 30)
    }
}
