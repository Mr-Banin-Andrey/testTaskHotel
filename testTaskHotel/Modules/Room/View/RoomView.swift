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
    
    private lazy var activityIndicator = UIActivityIndicatorView().activityIndicatorView
    
    private var rooms: [RoomModel] = []
    
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
    
    //MARK: Public methods
    
    func setupView(model: [RoomModel]) {
        self.rooms = model
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
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.activityIndicator)
        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
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
        rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.reuseID, for: indexPath) as? RoomCell
        else { return UITableViewCell() }
        
        cell.delegate = self
        cell.setupCell(model: rooms[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate

extension RoomView: UITableViewDelegate { }

//MARK: - RoomCellDelegate

extension RoomView: RoomCellDelegate {
    func bookRoom() {
        delegate?.showReservation()
    }
}
