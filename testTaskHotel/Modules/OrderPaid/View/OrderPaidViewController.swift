//
//  OrderPaidViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 27.12.23..
//

import UIKit

final class OrderPaidViewController: UIViewController {
    
    private lazy var orderPaidView = OrderPaidView(delegate: self)
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = orderPaidView
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

//MARK: - OrderPaidViewDelegate

extension OrderPaidViewController: OrderPaidViewDelegate {
    func closeDeal() {
        print("final")
    }
}
