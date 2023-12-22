//
//  HotelView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

//MARK: - HotelViewDelegate

protocol HotelViewDelegate: AnyObject {
    
}

//MARK: - HotelView

final class HotelView: UIView {
    
    private weak var delegate: HotelViewDelegate?
    
    //MARK: Properties
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(TitleHotelHeader.self, forHeaderFooterViewReuseIdentifier: TitleHotelHeader.reuseID)
        $0.register(DescriptionHotelCell.self, forCellReuseIdentifier: DescriptionHotelCell.reuseID)
        $0.separatorStyle = .none
        $0.backgroundColor = .tableViewBackgroundColor
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    private lazy var selectHotelButton = CustomBlueButton(
        title: "К выбору номера",
        titleColor: .mainBackgroundColor,
        backgroundColor: .mainButtonColor,
        action: actionButton
    )
    
    private lazy var lineView = UIView().lineViewTabBar
    
    //MARK: Initial
    
    init(delegate: HotelViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .mainBackgroundColor
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.tableView)
        self.addSubview(self.selectHotelButton)
        self.addSubview(self.lineView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            self.selectHotelButton.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 12),
            self.selectHotelButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 6),
            self.selectHotelButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.selectHotelButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            self.lineView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 0),
            self.lineView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.lineView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
    }
    
    //MARK: objc methods
    
    @objc private func actionButton() {
        
    }
}

//MARK: - UITableViewDataSource

extension HotelView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionHotelCell.reuseID, for: indexPath) as? DescriptionHotelCell
        else { return UITableViewCell() }
                
        return cell
    }
}

//MARK: - UITableViewDelegate

extension HotelView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleHotelHeader.reuseID) as? TitleHotelHeader
        else { return nil }

        return header
    }
}
