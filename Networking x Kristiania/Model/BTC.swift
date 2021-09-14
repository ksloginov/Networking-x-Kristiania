//
//  BTC.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 14.09.2021.
//

import Foundation

struct BTC: Codable {
    let assetIdBase: String
    let rates: [Rate]
}

struct Rate: Codable {
    let time: Date
    let assetIdQuote: String
    let rate: Double
}


//extension DateFormatter {
//    static let iso8601Full: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
//        return formatter
//    }()
//}
//
//....
//decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
