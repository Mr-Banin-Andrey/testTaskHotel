//
//  NetworkService.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 28.12.23..
//

import Foundation

enum Constants {
    static let hotelApi = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    static let roomsApi = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    static let reservationApi = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
}


protocol NetworkServiceProtocol: AnyObject {
    func fetchData<T: Decodable>(url: String, model: T.Type) async throws -> T
    func loadImage(url: String) async throws -> Data
}


final class NetworkService { }


extension NetworkService: NetworkServiceProtocol {
    
    func fetchData<T: Decodable>(url: String, model: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidServer
        }
        
        do {
            let rooms = try JSONDecoder().decode(T.self, from: data)
            return rooms
        } catch {
            throw NetworkError.parse
        }
    }
    
    func loadImage(url: String) async throws -> Data {
        return await withCheckedContinuation { [weak self] continuation in
            self?.loadImageUrlSessionDataTask(url: url) { (result: Result<Data, NetworkError>) in
                switch result {
                case .success(let data):
                    print(data)
                    continuation.resume(returning: data)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: Data())
                }
            }
        }
    }
    
    private func loadImageUrlSessionDataTask(url: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        let session = URLSession(configuration: config)
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.invalidServer))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                print("200...299 Запрос пользователя успешно получен, принят и обработан.")
            case 300...399:
                print("300...399 Для выполнения запроса пользователю необходимо выполнить дополнительное действие.")
            case 400...499:
                print("400...499 Запрос пользователя не выполнен, так как он содержит синтаксическую ошибку или возникла иная неполадка клиента. ")
            case 500...600:
                print("500...600 Запрос пользователя корректен, однако он не был выполнен из-за ошибки сервера. ")
            default:
                print("error")
            }
            
            completion(.success(data))
        }.resume()
    }
}
