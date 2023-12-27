//
//  ReservationViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

//MARK: - ReservationViewController

final class ReservationViewController: UIViewController {
    
    private lazy var reservationView = ReservationView(delegate: self)
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = reservationView
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

//MARK: - ReservationViewDelegate

extension ReservationViewController: ReservationViewDelegate {
    
}
