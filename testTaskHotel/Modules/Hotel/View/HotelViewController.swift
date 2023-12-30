//
//  HotelViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import UIKit

//MARK: - HotelViewController

final class HotelViewController: UIViewController {
    
    private lazy var hotelView = HotelView(delegate: self)
    private let viewModel: HotelViewModelProtocol
    
    //MARK: Initial
    
    init(
        viewModel: HotelViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = hotelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindViewModel()
        viewModel.updateState(viewInput: .willLoadHotel)
    }
    
    //MARK: Private methods
    
    private func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else {
                return
            }
            switch state {
            case .initial:
                print("initial")
                self.hotelView.updateViewVisibility(isHidden: true)
            case .loadHotel:
                self.hotelView.updateViewVisibility(isHidden: true)
                self.hotelView.updateLoadingAnimation(isLoading: true)
                print("loadHotel")
            case .loadedHotel(let hotel):
                DispatchQueue.main.async {
                    self.hotelView.setupView(model: hotel)
                    self.hotelView.updateViewVisibility(isHidden: false)
                    self.hotelView.reload()
                    self.setupNavigationBar()
                    print("loadedHotel")
                }
            }
        }
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .backgroundViewOrCellColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.mainTextColor]
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationItem.title = "Отель"
        let backBarButton = UIBarButtonItem()
        backBarButton.title = nil
        backBarButton.tintColor = .mainTextColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButton
    }
}

//MARK: - HotelViewDelegate

extension HotelViewController: HotelViewDelegate {
    
    func showRoom() {
        viewModel.updateState(viewInput: .showRoom(name: hotelView.getNameHotel()))
    }
}
