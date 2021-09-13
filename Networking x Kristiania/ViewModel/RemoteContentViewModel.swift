//
//  RemoteContentViewModel.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

class RemoteContentViewModel: ObservableObject {
    
    @Published var state: State = .initial
    
    func loadTranferConfig() {
        
    }
    
    func loadBTC() {
        
    }
    
    func loadLiveTicker() {
        
    }
    
    enum State {
        case initial
        case success
        case failure
    }
}
