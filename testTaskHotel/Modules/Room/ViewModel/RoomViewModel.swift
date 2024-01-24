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
                var roomDecodable: [RoomModelDecodable] = []
                do {
                    let roomsDecodable = try await networkService.fetchData(url: Constants.roomsApi, model: RoomsModelDecodable.self)
                    roomDecodable = DataConverter().roomsToRoomConvert(model: roomsDecodable)
                } catch NetworkError.invalidServer {
                    print(">>>>> Ошибка сервера")
                }
                
                var rooms: [RoomModel] = []
                do {
                    for room in roomDecodable {
                        var imagesData: [Data] = []
                        for imageUrl in room.images {
                            let picture = try await networkService.loadImage(url: imageUrl)
                            imagesData.append(picture)
                        }
                        rooms.append(DataConverter().roomModelConvert(model: room, data: imagesData))
                    }
                    self.state = .loadedRooms(rooms: rooms)
                } catch {
                    print(">>>>> \(error)")
                }
            }
        }
    }
}
