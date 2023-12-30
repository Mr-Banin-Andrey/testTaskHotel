//
//  RoomViewController.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 23.12.23..
//

import UIKit

final class RoomViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var roomView = RoomView(delegate: self)
    private let viewModel: RoomViewModelProtocol
    private let nameHotel: String
    
    //MARK: Initial
    
    init(
        viewModel: RoomViewModel,
        nameHotel: String
    ) {
        self.viewModel = viewModel
        self.nameHotel = nameHotel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    
    override func loadView() {
        super.loadView()
        
        view = roomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        bindViewModel()
        viewModel.updateState(viewInput: .willLoadRoom)
    }
    
    //MARK: Private methods
    
    private func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else {
                return
            }
            switch state {
            case .initial:
                self.roomView.updateViewVisibility(isHidden: true)
            case .loadingRooms:
                self.roomView.updateViewVisibility(isHidden: true)
                self.roomView.updateLoadingAnimation(isLoading: true)
            case .loadedRooms(let rooms):
                DispatchQueue.main.async {
                    self.roomView.setupView(model: rooms)
                    self.roomView.updateViewVisibility(isHidden: false)
                    self.roomView.reload()
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
        self.navigationItem.title = nameHotel
        let backBarButton = UIBarButtonItem()
        backBarButton.title = nil
        backBarButton.tintColor = .mainTextColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButton
    }
}

//MARK: - RoomViewDelegate

extension RoomViewController: RoomViewDelegate {
    func showReservation() {
        viewModel.updateState(viewInput: .selectRoom)
    }
}
