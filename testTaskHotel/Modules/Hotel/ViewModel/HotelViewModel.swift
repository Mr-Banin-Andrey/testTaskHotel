//
//  HotelViewModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import Foundation

//MARK: - HotelViewModelProtocol

protocol HotelViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((HotelViewModel.State) -> Void)? { get set }
    func updateState(viewInput: HotelViewModel.ViewInput)
}

//MARK: - HotelViewModel

final class HotelViewModel: HotelViewModelProtocol {
    
    enum State {
        case initial
        case loadHotel
        case loadedHotel(hotel: HotelModel)
    }
    
    enum ViewInput {
        case showRoom(name: String)
        case willLoadHotel
    }
    
    //MARK: Properties
    
    var onStateDidChange: ((State) -> Void)?
    
    weak var coordinator: AppCoordinator?
    
    private let networkService: NetworkServiceProtocol
    
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
        case .showRoom(let name):
            coordinator?.setupRoom(nameHotel: name)

        case .willLoadHotel:
            state = .loadHotel
            let downloadGroup = DispatchGroup()
            self.networkService.fetch(url: Constants.hotelApi) { [weak self] (result: Result <HotelModelDecodable, NetworkError>) in
                guard let self = self else { return }
                switch result {
                case .success(let hotelDecodable):
                    var imagesData: [Data] = []
                    hotelDecodable.images.forEach { image in
                        downloadGroup.enter()
                        self.networkService.loadImage(url: image) { [weak self] data in
                            guard let self = self else { return }
                            imagesData.append(data)
                            downloadGroup.leave()
                        }
                    }
                    downloadGroup.notify(queue: .main) {
                        let hotel = DataConverter().hotelModelConvert(model: hotelDecodable, data: imagesData)
                        self.state = .loadedHotel(hotel: hotel)
                    }
                case .failure(let error):
                    print("error", error)
                }
            }
        }
    }
}
