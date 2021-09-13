//
//  DataService.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidData
    case invalidURL
}

struct DataService {
    
    func loadData(url: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
}
