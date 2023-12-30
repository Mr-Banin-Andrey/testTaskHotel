//
//  OrderPaidViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 27.12.23..
//

import UIKit

final class OrderPaidViewController: UIViewController {
    
    private lazy var orderPaidView = OrderPaidView(delegate: self)
    private let viewModel: OrderPaidViewModelProtocol
    
    //MARK: Initial
    
    init(viewModel: OrderPaidViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = orderPaidView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        bindViewModel()
    }
    
    //MARK: Update State
    
    func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .initial:
                print("initial")
            }
        }
    }
    
    //MARK: Private methods
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .backgroundViewOrCellColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.mainTextColor]
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationItem.title = "Заказ оплачен"
        let backBarButton = UIBarButtonItem()
        backBarButton.title = nil
        backBarButton.tintColor = .mainTextColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButton
    }
}

//MARK: - OrderPaidViewDelegate

extension OrderPaidViewController: OrderPaidViewDelegate {
    func closeDeal() {
        viewModel.updateState(viewInput: .backToTourSelection)
    }
}
