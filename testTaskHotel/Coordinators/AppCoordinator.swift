//
//  AppCoordinator.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var viewController: UIViewController?
    
    func start() {
        self.setupHotel()
    }
    
    private func setupHotel() {
        let hotelViewModel = HotelViewModel(networkService: NetworkService())
        let hotelViewController = HotelViewController(viewModel: hotelViewModel)
        hotelViewModel.coordinator = self
        navigationController?.setViewControllers([hotelViewController], animated: true)
    }
    
    func setupRoom(nameHotel: String) {
        let roomViewModel = RoomViewModel(networkService: NetworkService())
        let roomViewController = RoomViewController(viewModel: roomViewModel, nameHotel: nameHotel)
        roomViewModel.coordinator = self
        navigationController?.pushViewController(roomViewController, animated: true)
    }
    
    func setupReservation() {
        let reservationViewModel = ReservationViewModel(networkService: NetworkService())
        let reservationViewController = ReservationViewController(viewModel: reservationViewModel)
        reservationViewModel.coordinator = self
        navigationController?.pushViewController(reservationViewController, animated: true)
    }
    
    func setupOrderPaid() {
        let orderPaidViewModel = OrderPaidViewModel()
        let orderPaidViewController = OrderPaidViewController(viewModel: orderPaidViewModel)
        orderPaidViewModel.coordinator = self
        navigationController?.pushViewController(orderPaidViewController, animated: true)
    }
}
