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
        guard let json = json, let data = json.data(using: .utf8) else {
            state = .failure
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        do {
            let _ = try decoder.decode(BTC.self, from: data)
            state = .success
        } catch {
            print(error)
            state = .failure
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter
    }
    
    func parseLiveTicker(_ json: String?) {
        guard let json = json, let data = json.data(using: .utf8) else {
            state = .failure
            return
        }
        
        let decoder = JSONDecoder()
        
        do {
            let _ = try decoder.decode(LiveTicker.self, from: data)
            state = .success
        } catch {
            state = .failure
        }
    }
    
    enum State {
        case initial
        case success
        case failure
    }
}
