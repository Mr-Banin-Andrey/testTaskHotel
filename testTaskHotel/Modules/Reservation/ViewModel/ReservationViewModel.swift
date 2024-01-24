//
//  ReservationViewModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation

protocol ReservationViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((ReservationViewModel.State) -> Void)? { get set }
    func updateState(viewInput: ReservationViewModel.ViewInput)
}


final class ReservationViewModel: ReservationViewModelProtocol {
    
    enum State {
        case initial
        case loadingData
        case loadedData(model: ReservationModelDecodable)
    }
    
    enum ViewInput {
        case payForTour
        case goingToBookRoom
    }
    
    //MARK: Properties
    
    weak var coordinator: AppCoordinator?
    
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    private let networkService: NetworkService
    
    //MARK: Initial
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    
    //MARK: UpdateState
    
    func updateState(viewInput: ViewInput) {
        switch viewInput {
        case .payForTour:
            coordinator?.setupOrderPaid()
        case .goingToBookRoom:
            print("goingToBookRoom")
            
            state = .loadingData
            
            Task {
                do {
                    let reservation = try await networkService.fetchData(url: Constants.reservationApi, model: ReservationModelDecodable.self)
                    state = .loadedData(model: reservation)
                } catch NetworkError.invalidServer {
                    print(">>>>> Ошибка сервера")
                }
            }
        }
    }
}
