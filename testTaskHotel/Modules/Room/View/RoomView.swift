//
//  RoomView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.12.23..
//

import UIKit

protocol RoomViewDelegate: AnyObject {
    func showReservation()
}

//MARK: - RoomView

final class RoomView: UIView {
    
    private weak var delegate: RoomViewDelegate?
    
    //MARK: Properties
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(RoomCell.self, forCellReuseIdentifier: RoomCell.reuseID)
        $0.separatorStyle = .none
        $0.backgroundColor = .tableViewBackgroundColor
        $0.contentInset = UIEdgeInsets(top: -32, left: 0, bottom: -32, right: 0)
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    private var mockAdvantages = ["Всё включено", "Кондиционер"]
    private var mockDescriptionHotel = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    private var mockImages: [UIImage] = [._1, ._2, ._3, ._4, ._5,._1, ._2, ._3, ._4, ._5,._1, ._2, ._3, ._4, ._5,._1, ._2, ._3, ._4,]
    
    //MARK: Initial
    
    init(delegate: RoomViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.backgroundColor = .backgroundViewOrCellColor
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - UITableViewDataSource

extension RoomView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.reuseID, for: indexPath) as? RoomCell
        else { return UITableViewCell() }
        
        cell.tapAction = { [unowned self] word in
            print("tapAction", word)
            delegate?.showReservation()
        }
        
        cell.setupCell(mockImages, mockAdvantages)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension RoomView: UITableViewDelegate {

}
