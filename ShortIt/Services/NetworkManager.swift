//
//  NetworkManager.swift
//  ShortIt
//
//  Created by Александр on 14/01/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let api = "http://tiny-url.info/api/v1/create?apikey=9874D9BE5139960ACDA&provider=goo_gl&format=json&url="
    
    private init() {}
    
    func fetchData(with url: String, completion: @escaping(Result<Responce, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Responce.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
