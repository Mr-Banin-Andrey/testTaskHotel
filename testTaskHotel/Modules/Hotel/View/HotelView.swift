//
//  HotelView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

//MARK: - HotelViewDelegate

protocol HotelViewDelegate: AnyObject {
    func showRoom()
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
        titleColor: .buttonTextColor,
        backgroundColor: .buttonColor) {
            self.delegate?.showRoom()
        }
    
    private lazy var lineView = UIView().lineViewTabBar
    private lazy var activityIndicator = UIActivityIndicatorView().activityIndicatorView
    
    private var hotel = HotelModel(id: 0,name: "",address: "", minimalPrice: 0,priceForIt: "",rating: 0,ratingName: "",images: [],aboutTheHotel: AboutTheHotel(description: "", peculiarities: []))
    
    
    //MARK: Initial
    
    init(
        delegate: HotelViewDelegate
    ) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .backgroundViewOrCellColor
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public methods
    
    func setupView(model: HotelModel) {
        self.hotel = model
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func updateViewVisibility(isHidden: Bool) {
        if isHidden {
            lineView.alpha = 0
            selectHotelButton.alpha = 0
        } else {
            lineView.alpha = 1
            selectHotelButton.alpha = 1
        }
        tableView.isHidden = isHidden
        activityIndicator.isHidden = !isHidden
    }

    func updateLoadingAnimation(isLoading: Bool) {
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func getNameHotel() -> String {
        self.hotel.name
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.activityIndicator)
        self.addSubview(self.tableView)
        self.addSubview(self.selectHotelButton)
        self.addSubview(self.lineView)
        
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            self.lineView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor),
            self.lineView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            self.selectHotelButton.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 12),
            self.selectHotelButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.selectHotelButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.selectHotelButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6),
        ])
    }
}

//MARK: - UITableViewDataSource

extension HotelView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionHotelCell.reuseID, for: indexPath) as? DescriptionHotelCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(model: hotel)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension HotelView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleHotelHeader.reuseID) as? TitleHotelHeader
        else { return nil }
        
        header.setupHeader(model: hotel)
        return header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 490
    }
}
