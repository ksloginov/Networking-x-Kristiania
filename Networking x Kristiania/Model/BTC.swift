//
//  BTC.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import Foundation

struct BTC: Codable {
    let assetIdBase: String
    let rates: [Rate]
}

struct Rate: Codable {
    let time: String
    let assetIdQuote: String
    let rate: Double
}
