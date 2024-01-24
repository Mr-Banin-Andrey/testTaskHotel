//
//  NetworkError.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 29.12.23..
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidServer
    case parse
    case unknown
    
    var debugDescription: String {
        switch self {
        case .invalidURL:
            return "Невалидный URL"
        case .invalidServer:
            return "Ошибка сервера"
        case .parse:
            return "Ошибка парсинга данных"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}
