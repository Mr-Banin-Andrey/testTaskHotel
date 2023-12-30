//
//  ReservationViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 26.12.23..
//

import UIKit

//MARK: - ReservationViewController

final class ReservationViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var reservationView = ReservationView(delegate: self)
    private let viewModel: ReservationViewModelProtocol
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = reservationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        bindViewModel()
        viewModel.updateState(viewInput: .goingToBookRoom)
    }
    
    //MARK: Initial
    
    init(viewModel: ReservationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Update state
    
    func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .initial:
                self.reservationView.updateViewVisibility(isHidden: true)
            case .loadingData:
                self.reservationView.updateViewVisibility(isHidden: true)
                self.reservationView.updateLoadingAnimation(isLoading: true)
                
            case .loadedData(let book):
                DispatchQueue.main.async {
                    self.reservationView.setupView(model: book)
                    self.reservationView.updateViewVisibility(isHidden: false)
                    self.reservationView.reload()
                }
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
        self.navigationItem.title = "Бронирование"
        let backBarButton = UIBarButtonItem()
        backBarButton.title = nil
        backBarButton.tintColor = .mainTextColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButton
    }
}

//MARK: - ReservationViewDelegate

extension ReservationViewController: ReservationViewDelegate {
    func goToPay() {
        viewModel.updateState(viewInput: .payForTour)
    }
}
