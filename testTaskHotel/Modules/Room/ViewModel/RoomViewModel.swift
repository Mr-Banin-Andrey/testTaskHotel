//
//  RoomViewModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation

//MARK: - RoomViewModelProtocol

protocol RoomViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((RoomViewModel.State) -> Void)? { get set }
    func updateState(viewInput: RoomViewModel.ViewInput)
}

//MARK: - RoomViewModel

final class RoomViewModel: RoomViewModelProtocol {
    
    enum State {
        case initial
        case loadingRooms
        case loadedRooms(rooms: [RoomModel])
    }
    
    enum ViewInput {
        case selectRoom
        case willLoadRoom
    }
    
    //MARK: Properties
    
    var onStateDidChange: ((State) -> Void)?
    
    weak var coordinator: AppCoordinator?
    
    private let networkService: NetworkServiceProtocol
    private var roomsDecodable: [RoomModelDecodable] = []
    private var rooms: [RoomModel] = []
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    //MARK: Initial
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    //MARK: UpdateState
    
    func updateState(viewInput: ViewInput) {
        switch viewInput {
        case .selectRoom:
            print("selectRoom")
            coordinator?.setupReservation()
        case .willLoadRoom:
            state = .loadingRooms
            Task {
                roomsDecodable = try await self.networkService.getRooms(url: Constants.roomsApi)
                for room in roomsDecodable {
                    let data = try await self.networkService.getRoomImages(roomDecodable: room)
                    rooms.append(DataConverter().roomModelConvert(model: room, data: data))
                }
                state = .loadedRooms(rooms: rooms)
            }
        }
    }
    
}
