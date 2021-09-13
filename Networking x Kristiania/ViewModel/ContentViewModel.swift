//
//  ViewModel.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var state: State = .initial
    
    func provideJson(_ fileName: String) -> String? {
        guard let contentsOfFile = Bundle.main.path(forResource: fileName, ofType: "json") else {
            state = .failure
            return nil
        }
        
        guard let data = NSData(contentsOfFile: contentsOfFile) else {
            state = .failure
            return nil
        }
        
        let json = String(data: data as Data, encoding: .utf8)
        return json
    }
    
    // Normal case
    func parseTransfersConfig(_ json: String?) {
        guard let json = json else {
            state = .failure
            return
        }
        
        // TODO: Parse TransfersConfig
        state = .failure
    }
    
    // Snake case
    func parseBTC(_ json: String?) {
        guard let data = json?.data(using: .utf8) else {
            state = .failure
            return
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            _ = try decoder.decode(BTC.self, from: data)
            state = .success
        } catch {
            state = .failure
        }
    }
    
    // TODO for you!
    func parseLiveTicker(_ json: String?) {
        guard let json = json else {
            state = .failure
            return
        }
        
        // TODO: Parse LiveTicker
        state = .success
    }
    
    enum State {
        case initial
        case success
        case failure
    }
}
