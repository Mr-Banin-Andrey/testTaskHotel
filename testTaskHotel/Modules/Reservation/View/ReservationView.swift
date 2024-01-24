//
//  ReservationView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

//MARK: - ReservationViewDelegate

protocol ReservationViewDelegate: AnyObject {
    func goToPay()
    func showAlert()
}

//MARK: - ReservationView

final class ReservationView: UIView {
    
    //MARK: Properties
    
    private weak var delegate: ReservationViewDelegate?
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(OrderParametersHeader.self, forHeaderFooterViewReuseIdentifier: OrderParametersHeader.reuseID)
        $0.register(FinalPriceAndAddTouristFooter.self, forHeaderFooterViewReuseIdentifier: FinalPriceAndAddTouristFooter.reuseID)
        $0.register(TouristCell.self, forCellReuseIdentifier: TouristCell.reuseID)
        $0.separatorStyle = .none
        $0.backgroundColor = .tableViewBackgroundColor
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    private lazy var selectHotelButton = CustomBlueButton(
        title: "Оплатить",
        titleColor: .buttonTextColor,
        backgroundColor: .buttonColor) {
            if self.isEmptyData(self.datePerson) {
                self.delegate?.goToPay()
            } else {
                self.delegate?.showAlert()
            }
        }
    
    private lazy var lineView = UIView().lineViewTabBar
    
    private lazy var activityIndicator = UIActivityIndicatorView().activityIndicatorView
    
    private var namesOfTourists = ["Первый турист", "Второй турист"]
    private var arrayName = ["Третий турист", "Четвертый турист", "Пятый турист", "Шестой турист", "Седьмой турист", "Восьмой турист", "Девятый турист", "Десятый турист"]
    
    private var reservationModel = ReservationModelDecodable(id: 0, hotelName: "", hotelAddress: "", horating: 0, ratingName: "", departure: "", arrivalCountry: "", tourDateStart: "", tourDateStop: "", numberOfNights: 0, room: "", nutrition: "", tourPrice: 0, fuelCharge: 0, serviceCharge: 0)
    
    private var datePerson: [String: String] = [
        "isNumberTextAction":"",
        "isEmailTextAction":"",
        "isFirstNameTextAction":"",
        "isLastNameTextAction":"",
        "isBirthdayTextAction":"",
        "isCitizenshipTextAction":"",
        "isPassportNumberTextAction":"",
        "isPassportValidityPeriodTextAction":""
    ]
    
    //MARK: Initial
    
    init(delegate: ReservationViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .backgroundViewOrCellColor
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    //MARK: Public methods
    
    func setupView(model: ReservationModelDecodable) {
        let finalPrice = model.tourPrice + model.fuelCharge + model.serviceCharge
        
        self.reservationModel = model
        self.selectHotelButton.setTitle("Оплатить \(UsefulMethods().formatNumber(finalPrice)) ₽", for: .normal)
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func updateViewVisibility(isHidden: Bool) {
        tableView.isHidden = isHidden
        activityIndicator.isHidden = !isHidden
    }

    func updateLoadingAnimation(isLoading: Bool) {
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func presentAlert(controller: UIViewController, title: String, message: String? = nil, textButton: String) {
        let alertController = UIAlertController(title: title,message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Попробовать ещё раз", style: .cancel)
        alertController.addAction(dismissAction)
        controller.present(alertController, animated: true)
    }
    
    //MARK: Private methods
    
    private func isEmptyData(_ dict: [String: String]) -> Bool {
        for value in dict.values {
            if value == "" {
                return false
            }
        }
        return true
    }
    
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
            
            self.selectHotelButton.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 12),
            self.selectHotelButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.selectHotelButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.selectHotelButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6),
        ])
    }
}

//MARK: - UITableViewDataSource

extension ReservationView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        namesOfTourists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TouristCell.reuseID, for: indexPath) as? TouristCell
        else { return UITableViewCell() }

        cell.setupCell(namesOfTourists[indexPath.row])
        cell.delegate = self
        
        cell.isFirstNameTextAction = { [unowned self] isText in
            datePerson["isFirstNameTextAction"] = isText
        }
        
        cell.isLastNameTextAction = { [unowned self] isText in
            datePerson["isLastNameTextAction"] = isText
        }
        
        cell.isBirthdayTextAction = { [unowned self] isText in
            datePerson["isBirthdayTextAction"] = isText
        }
        
        cell.isCitizenshipTextAction = { [unowned self] isText in
            datePerson["isCitizenshipTextAction"] = isText
        }
        
        cell.isPassportNumberTextAction = { [unowned self] isText in
            datePerson["isPassportNumberTextAction"] = isText
        }
        
        cell.isPassportValidityPeriodTextAction = { [unowned self] isText in
            datePerson["isPassportValidityPeriodTextAction"] = isText
        }
        
        if indexPath.row == 0 {
            cell.state = .open
        } else {
            cell.state = .close
        }
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ReservationView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: OrderParametersHeader.reuseID) as? OrderParametersHeader
        else { return nil }
        header.setupHeader(model: reservationModel)
        
        header.isNumberTextAction = { [unowned self] isText in
            datePerson["isNumberTextAction"] = isText
        }
        
        header.isEmailTextAction = { [unowned self] isText in
            datePerson["isEmailTextAction"] = isText
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: FinalPriceAndAddTouristFooter.reuseID) as? FinalPriceAndAddTouristFooter
        else { return nil }
        footer.delegate = self
        footer.setupFooter(model: reservationModel)
        return footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TouristCell else { return }
        
            
        if cell.state == .close {
            cell.state(state: .open)
        } else {
            cell.state(state: .close)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 700
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 230
    }
}

//MARK: - TouristCellDelegate

extension ReservationView: TouristCellDelegate {
    func beginUpdateView() {
        tableView.beginUpdates()
    }
    
    func endUpdateView() {
        tableView.endUpdates()
    }
}

//MARK: - FinalPriceAndAddTouristFooterDelegate

extension ReservationView: FinalPriceAndAddTouristFooterDelegate {
    func addTourist() {
        let count = namesOfTourists.count
        let tourist = arrayName.remove(at: 0)
        
        self.namesOfTourists.insert(tourist, at: count)
        self.tableView.insertRows(at: [IndexPath(row: count, section: 0)], with: .none)
        self.tableView.scrollToRow(at: IndexPath(row: count, section: 0), at: .bottom, animated: true)
    }
}
