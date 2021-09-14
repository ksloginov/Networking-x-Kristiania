//
//  RemoteContentViewModel.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

class RemoteContentViewModel: ObservableObject {
    
    @Published var state: State = .initial
    
    let dataService: DataService = DataService()
    
    func loadTranferConfig() {
        
    }
    
    func loadBTC() {
        
    }
    
    func loadLiveTicker() {
        dataService.loadLiveTicker { [weak self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.state = .success
                }
            case .failure(let handledError):
                DispatchQueue.main.async {
                    self?.state = .failure
                }
                print(handledError)
            }
        }
    }
    
    enum State {
        case initial
        case success
        case failure
    }
}
