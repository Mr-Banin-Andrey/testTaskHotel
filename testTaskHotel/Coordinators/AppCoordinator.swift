//
//  AppCoordinator.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController = UINavigationController()
    
    func start() {
        self.setupHotel()
    }
    
    private func setupHotel() {
        let hotelViewModel = HotelViewModel(networkService: NetworkService())
        let hotelViewController = HotelViewController(viewModel: hotelViewModel)
        hotelViewModel.coordinator = self
        navigationController.setViewControllers([hotelViewController], animated: true)
        setupNavController()
    }
    
    func setupRoom(nameHotel: String) {
        let roomViewModel = RoomViewModel(networkService: NetworkService())
        let roomViewController = RoomViewController(viewModel: roomViewModel, nameHotel: nameHotel)
        roomViewModel.coordinator = self
        navigationController.pushViewController(roomViewController, animated: true)
        setupNavController()
    }
    
    func setupReservation() {
        let reservationViewModel = ReservationViewModel(networkService: NetworkService())
        let reservationViewController = ReservationViewController(viewModel: reservationViewModel)
        reservationViewModel.coordinator = self
        navigationController.pushViewController(reservationViewController, animated: true)
        setupNavController()
    }
    
    func setupOrderPaid() {
        let orderPaidViewModel = OrderPaidViewModel()
        let orderPaidViewController = OrderPaidViewController(viewModel: orderPaidViewModel)
        orderPaidViewModel.coordinator = self
        navigationController.pushViewController(orderPaidViewController, animated: true)
        setupNavController()
    }
    
    private func setupNavController() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .backgroundViewOrCellColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.mainTextColor]
        navBarAppearance.configureWithTransparentBackground()
        self.navigationController.navigationBar.standardAppearance = navBarAppearance
        self.navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
