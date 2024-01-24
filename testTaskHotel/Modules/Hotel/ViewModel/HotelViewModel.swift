//
//  HotelViewModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 19.12.23..
//

import Foundation
import UIKit

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
            Task {
                var imagesData = [Data]()
                do {
                    let hotelDecodable = try await networkService.fetchData(url: Constants.hotelApi, model: HotelModelDecodable.self)
                    for imageUrl in hotelDecodable.images {
                        let pictures = try await networkService.loadImage(url: imageUrl)
                        imagesData.append(pictures)
                    }
                    
                    let hotel = DataConverter().hotelModelConvert(model: hotelDecodable, data: imagesData)
                    self.state = .loadedHotel(hotel: hotel)
                } catch NetworkError.invalidServer {
                    print(">>>>> Ошибка сервера")
                }
            }
        }
    }
}
