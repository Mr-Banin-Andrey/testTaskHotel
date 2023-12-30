//
//  OrderPaidViewModel.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation

protocol OrderPaidViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((OrderPaidViewModel.State) -> Void)? { get set }
    func updateState(viewInput: OrderPaidViewModel.ViewInput)
}

final class OrderPaidViewModel: OrderPaidViewModelProtocol {
    
    enum State {
        case initial
    }
    
    enum ViewInput {
        case backToTourSelection
    }
    
    weak var coordinator: AppCoordinator?
    
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    func updateState(viewInput: ViewInput) {
        switch viewInput {
        case .backToTourSelection:
            coordinator?.start()
        }
    }
}
