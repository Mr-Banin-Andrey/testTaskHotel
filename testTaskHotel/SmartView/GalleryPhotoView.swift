//
//  GalleryPhotoView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

final class GalleryPhotoView: UIView {
    
    //MARK: Properties
    
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = true
        $0.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * 4, height: 257)
        $0.frame = self.bounds
        $0.delegate = self
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UIScrollView())
    
    private lazy var pictureImage1: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "1")
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var pictureImage2: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "2")
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var pictureImage3: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "3")
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var pictureImage4: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "4")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var pageControl: UIPageControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.currentPage = 0
        $0.numberOfPages = 4
        $0.backgroundStyle = .automatic
        $0.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)
        return $0
    }(UIPageControl())
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.heightAnchor.constraint(equalToConstant: 257).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.pictureImage1)
        self.scrollView.addSubview(self.pictureImage2)
        self.scrollView.addSubview(self.pictureImage3)
        self.scrollView.addSubview(self.pictureImage4)
        self.addSubview(self.pageControl)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.pictureImage1.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.pictureImage1.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            self.pictureImage1.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.pictureImage1.heightAnchor.constraint(equalToConstant: 257),
            self.pictureImage1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            self.pictureImage2.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.pictureImage2.leadingAnchor.constraint(equalTo: self.pictureImage1.trailingAnchor, constant: 32),
            self.pictureImage2.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.pictureImage2.heightAnchor.constraint(equalToConstant: 257),
            self.pictureImage2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            self.pictureImage3.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.pictureImage3.leadingAnchor.constraint(equalTo: self.pictureImage2.trailingAnchor, constant: 32),
            self.pictureImage3.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.pictureImage3.heightAnchor.constraint(equalToConstant: 257),
            self.pictureImage3.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            self.pictureImage4.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.pictureImage4.leadingAnchor.constraint(equalTo: self.pictureImage3.trailingAnchor, constant: 32),
            self.pictureImage4.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            self.pictureImage4.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.pictureImage4.heightAnchor.constraint(equalToConstant: 257),
            self.pictureImage4.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            self.pageControl.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -8),
            self.pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    @objc private func pageDidChange() {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
}

extension GalleryPhotoView: UIScrollViewDelegate {
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
    
}
