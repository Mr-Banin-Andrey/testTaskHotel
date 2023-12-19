//
//  CustomBlueButtom.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import Foundation

import UIKit

final class CustomBlueButtom: UIButton {
    
    typealias Action = () -> Void
    
    var buttonAction: Action
    
    init(
        title: String,
        titleColor: UIColor,
        backgroundColor: UIColor?,
        action: @escaping Action
    ) {
        self.buttonAction = action
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        
        addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionButton() {
        buttonAction()
    }
}
