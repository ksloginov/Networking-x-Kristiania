//
//  RemoteContentViewModel.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

class RemoteContentViewModel: ObservableObject {
    
    @Published var state: State = .initial
    private var dataService = DataService()
    
    func loadTranferConfig() {
        
    }
    
    func loadBTC() {
        
    }
    
    func loadLiveTicker() {
        dataService.loadData(url: EndPoint.liveTicker.url) { [weak self] result in
            switch result {
            case .success(let data):
                // TODO: parse
                DispatchQueue.main.async { [weak self] in
                    self?.state = .success
                }
            break
            case .failure(_):
                DispatchQueue.main.async { [weak self] in
                    self?.state = .failure
                }
            }
        }
    }
    
    enum State {
        case initial
        case success
        case failure
    }
}
