//
//  TouristCell.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

protocol TouristCellDelegate: AnyObject {
    func beginUpdateView()
    func endUpdateView()
}

final class TouristCell: UITableViewCell {
    
    enum State {
        case open
        case close
    }
    
    static let reuseID = "TouristCellID"
    
    weak var delegate: TouristCellDelegate?
        
    var isFirstNameTextAction: ((String) -> Void)?
    var isLastNameTextAction: ((String) -> Void)?
    var isBirthdayTextAction: ((String) -> Void)?
    var isCitizenshipTextAction: ((String) -> Void)?
    var isPassportNumberTextAction: ((String) -> Void)?
    var isPassportValidityPeriodTextAction: ((String) -> Void)?
    
    //MARK: Properties
    
    private lazy var backgroundCell = UIView().backgroundViewCell
    private lazy var titleLabel = UILabel(state: .titleLabel)
    
    private lazy var arrowImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "chevron.up")
        $0.contentMode = .center
        $0.backgroundColor = .arrowBackColor
        $0.tintColor = .arrowTintColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
        return $0
    }(UIImageView())
    
    private lazy var dataStackView = UIStackView().dataStackView
    private lazy var firstNameTextField = CustomTextField(titleOrPlaceholder: "Имя", mode: .onlyPlaceholder) { text in
        self.isFirstNameTextAction?(text)
    }
    private lazy var lastNameTextField = CustomTextField(titleOrPlaceholder: "Фамилия", mode: .onlyPlaceholder) { text in
        self.isLastNameTextAction?(text)
    }
    private lazy var birthdayTextField = CustomTextField(titleOrPlaceholder: "Дата рождения", mode: .onlyPlaceholder) { text in
        self.isBirthdayTextAction?(text)
    }
    private lazy var citizenshipTextField = CustomTextField(titleOrPlaceholder: "Гражданство", mode: .onlyPlaceholder) { text in
        self.isCitizenshipTextAction?(text)
    }
    private lazy var passportNumberTextField = CustomTextField(titleOrPlaceholder: "Номер загранпаспорта", mode: .onlyPlaceholder, keyboardType: .default) { text in
        self.isPassportNumberTextAction?(text)
    }
    private lazy var passportValidityPeriodTextField = CustomTextField(titleOrPlaceholder: "Срок действия загранпаспорта", mode: .onlyPlaceholder) { text in
        self.isPassportValidityPeriodTextAction?(text)
    }
    
    private lazy var dataStackViewBottomConstraint = self.dataStackView.bottomAnchor.constraint(equalTo: self.backgroundCell.bottomAnchor, constant: -16)
    private lazy var titleLabelBottomConstraint = self.titleLabel.bottomAnchor.constraint(equalTo: self.backgroundCell.bottomAnchor, constant: -16)
    
    var state: State = .close {
        didSet{
            delegate?.beginUpdateView()
            switch state {
            case .close:
                print("close")
                self.dataStackViewBottomConstraint.isActive = false
                self.dataStackView.isHidden = true
                self.titleLabelBottomConstraint.isActive = true
                
                UIView.animate(withDuration: 0.3, animations: { [weak self] in
                    self?.arrowImage.transform = CGAffineTransform(rotationAngle: 180 * (.pi/180))
                    self?.layoutIfNeeded()
                })
                
            case .open:
                print("open")
                UIView.animate(withDuration: 0.3, animations: { [weak self] in
                    self?.titleLabelBottomConstraint.isActive = false
                    self?.dataStackViewBottomConstraint.isActive = true
                    self?.dataStackView.isHidden = false
                    self?.arrowImage.transform = .identity
                    self?.layoutIfNeeded()
                })
            }
            delegate?.endUpdateView()
        }
    }
    
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
    
    //MARK: Life cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
    }
    
    //MARK: Public methods
    
    func setupCell(_ text: String) {
        self.titleLabel.text = text
    }

    func state(state: State) {
        switch state {
        case .open:
            self.state = .open
        case .close:
            self.state = .close
        }
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.contentView.addSubview(self.backgroundCell)
    
        self.backgroundCell.addSubview(self.titleLabel)
        self.backgroundCell.addSubview(self.arrowImage)
        self.backgroundCell.addSubview(self.dataStackView)
        
        self.dataStackView.addArrangedSubview(self.firstNameTextField)
        self.dataStackView.addArrangedSubview(self.lastNameTextField)
        self.dataStackView.addArrangedSubview(self.birthdayTextField)
        self.dataStackView.addArrangedSubview(self.citizenshipTextField)
        self.dataStackView.addArrangedSubview(self.passportNumberTextField)
        self.dataStackView.addArrangedSubview(self.passportValidityPeriodTextField)
        
        NSLayoutConstraint.activate([
            self.backgroundCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backgroundCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.backgroundCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.backgroundCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.backgroundCell.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundCell.leadingAnchor, constant: 16),
            
            titleLabelBottomConstraint,
            
            self.arrowImage.heightAnchor.constraint(equalToConstant: 42),
            self.arrowImage.widthAnchor.constraint(equalToConstant: 32),
            self.arrowImage.topAnchor.constraint(equalTo: self.backgroundCell.topAnchor, constant: 10),
            self.arrowImage.trailingAnchor.constraint(equalTo: self.backgroundCell.trailingAnchor, constant: -16),
            
            self.dataStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.dataStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.dataStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
        ])
    }
}
