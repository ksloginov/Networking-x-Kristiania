//
//  Endpoint.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

enum EndPoint {
    
    case liveTicker
    case btc
    case transfersConfig
    
    var url: String {
        switch self {
        case .liveTicker:
            return "https://data.fotmob.com/webcl/ltc/gsm/3609964_en.json.gz"
        case .btc:
            return "https://rest.coinapi.io/v1/exchangerate/BTC?apikey=26807AD6-C5AF-41AD-BE0B-D6A1049C182A"
        case .transfersConfig:
            return "https://data.fotmob.com/settings/transfers/config.json.gz"
        }
    }
}
