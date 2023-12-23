//
//  GalleryPhotoView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

final class GalleryPhotoView: UIView {
    
    //MARK: Properties
    
    private var imagesArray: [UIImage]
    
    private lazy var pageControl: UIPageControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.currentPage = 0
        $0.numberOfPages = imagesArray.count
        $0.backgroundStyle = .minimal
        $0.isEnabled = false
        $0.size(forNumberOfPages: 1)
        return $0
    }(UIPageControl())
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.minimumLineSpacing = 0
        $0.scrollDirection = .horizontal
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseID)
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: self.layout))
    
    
    //MARK: Initial
    
    init(images: [UIImage]) {
        self.imagesArray = images
        super.init(frame: .zero)
        
        self.heightAnchor.constraint(equalToConstant: 257).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(collectionView)
        self.addSubview(self.pageControl)
                
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.pageControl.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: -8),
            self.pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
}

//MARK: - UICollectionViewDataSource

extension GalleryPhotoView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseID, for: indexPath) as? ImageCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
            return cell
        }
        
        cell.setupCell(imagesArray[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension GalleryPhotoView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 257)
    }
}

//MARK: - UIScrollViewDelegate

extension GalleryPhotoView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
