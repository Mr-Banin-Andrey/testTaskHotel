//
//  NetworkError.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import Foundation

enum NetworkError: Error {
    case server(reason: String)
    case parse(String)
    case encode(String)
    case unknown
    
    var debugDescription: String {
        switch self {
        case .server(let reason):
            return "Ошибка сервера: \(reason)"
        case let .parse(description), let .encode(description):
            return "Ошибка парсинга данных: \(description)"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}
