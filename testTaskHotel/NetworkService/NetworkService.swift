//
//  NetworkService.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation
import UIKit.UIImage

enum Constants {
    static let hotelApi = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    static let roomsApi = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    static let reservationApi = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
}

protocol NetworkServiceProtocol: AnyObject {
    func fetch<T>(url: String, completion: @escaping(Result<T, NetworkError>) -> Void) where T: Decodable
    func loadImage(url: String, completion: @escaping (Data) -> Void)
    
    func getRooms(url: String) async throws -> [RoomModelDecodable]
    func getRoomImages(roomDecodable: RoomModelDecodable) async throws -> [Data]
}

final class NetworkService { }

extension NetworkService: NetworkServiceProtocol {
    
    func getRooms(url: String) async throws -> [RoomModelDecodable] {
        guard let url = URL(string: url) else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let rooms = try JSONDecoder().decode(RoomsModelDecodable.self, from: data)
        return rooms.rooms
    }
        
    func getRoomImages(roomDecodable: RoomModelDecodable) async throws -> [Data] {
        var imagesData: [Data] = []
        for url in roomDecodable.images {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            imagesData.append(data)
        }
        return imagesData
    }
    
    
    func loadImage(url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("loaded")
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
    
    func fetch<T>(url: String, completion: @escaping(Result<T, NetworkError>) -> Void) where T: Decodable {
        guard let url = URL(string: url) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.server(reason: error.localizedDescription)))
                return
            }

            guard let data = data else {
                completion(.failure(.unknown))
                return
            }

            do {
                let news = try JSONDecoder().decode(T.self, from: data)
                
                completion(.success(news))
            } catch let error {
                completion(.failure(.parse(error.localizedDescription)))
            }
        }.resume()
    }
}
