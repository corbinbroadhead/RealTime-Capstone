//
//  Score.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/13/23.
//

import UIKit

struct Score: Codable {
    var awayTeamId: Int
    var homeTeamId: Int
    var status: String
    var quarter: String?
    var homeScore: Int?
    var awayScore: Int?
    
    enum CodingKeys: String, CodingKey {
        case awayTeamId = "AwayTeamID"
        case homeTeamId = "HomeTeamID"
        case status = "Status"
        case quarter = "Quarter"
        case homeScore = "HomeScore"
        case awayScore = "AwayScore"
    }
}
