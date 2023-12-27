//
//  RoomViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.12.23..
//

import UIKit

final class RoomViewController: UIViewController {
    
    private lazy var roomView = RoomView(delegate: self)
    
    //MARK: Initial
    
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = roomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
    }
    
    //MARK: Private methods
    
    private func setupNavigationBar() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .backgroundViewOrCellColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.mainTextColor]
        
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        self.navigationItem.title = "Какой-то отель"
        
        let backBarButton = UIBarButtonItem()
        backBarButton.title = nil
        backBarButton.tintColor = .mainTextColor

        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButton
    }
}

//MARK: - RoomViewDelegate

extension RoomViewController: RoomViewDelegate {
    func showReservation() {
        let reservationVc = ReservationViewController()
        navigationController?.pushViewController(reservationVc, animated: true)
    }
}
