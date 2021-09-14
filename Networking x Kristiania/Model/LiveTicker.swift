//
//  LiveTicker.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 14.09.2021.
//

import Foundation

class LiveTicker: Codable {
    let lang: String
    let homeId: String
    let awayId: Int
    
    private enum CodingKeys: String, CodingKey {
        case lang = "Lang"
        case homeId = "HometeamId"
        case awayId = "AwayteamId"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lang = try container.decode(String.self, forKey: .lang)
        let receivedValue = try container.decode(Int.self, forKey: .homeId)
        homeId = String(receivedValue)
        awayId = try container.decode(Int.self, forKey: .awayId)
    }
}

//"Lang": "en",
//"HometeamId": 8463,
//"AwayteamId": 8650,
//"Events": [
//  {
//    "IncidentCode": "stats",
//    "Elapsed": 0,
//    "ElapsedPlus": -1,
//    "Description": "Liverpool's win takes them to third in the Premier League table, level on points with Manchester United and Chelsea. They'll be satisfied with their outing, although Elliott's injury will be a cause for concern. Leeds stay 17th. They haven't quite clicked yet this season but Bielsa will surely get his side firing again.",
//    "IncludeInHighlight": false
//  },
