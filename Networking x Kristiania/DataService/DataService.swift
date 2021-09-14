//
//  DataService.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 14.09.2021.
//

import Foundation

enum CustomFailures: Error {
    case URLFormatFailed
    case FailedToLoadData
}

struct DataService {
    func loadLiveTicker(complete: @escaping ((Result<LiveTicker?, Error>) -> Void)) {
        guard let url = URL(string: EndPoint.liveTicker.url) else {
            complete(.failure(CustomFailures.URLFormatFailed))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let value = try JSONDecoder().decode(LiveTicker.self, from: data)
                    complete(.success(value))
                } catch {
                    complete(.failure(error))
                }
                
                return
            }
            
            complete(.failure(CustomFailures.FailedToLoadData))
        }.resume()
    }
    
}
