//
//  ServicesView.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 22.12.23..
//

import UIKit

//MARK: - ServicesView

final class ServicesView: UIView {
    
    //MARK: Properties
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(ServiceCell.self, forCellReuseIdentifier: ServiceCell.reuseID)
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    //MARK: Initial
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 184).isActive = true
        self.backgroundColor = .tileBackgroundColor
        self.layer.cornerRadius = 15
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    
    private func setupUI() {
        self.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
        ])
    }
    
}

//MARK: - UITableViewDataSource

extension ServicesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: ServiceCell.reuseID, for: indexPath) as? ServiceCell
        else { return UITableViewCell() }
        
        let service = ArrayServices().array[indexPath.row]
        cell.setupService(model: service)
        if indexPath.row == 2 {
            cell.setupUnderline()
        }
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension ServicesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row - ", indexPath.row)
    }
}
