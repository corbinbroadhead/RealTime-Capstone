//
//  Game.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/10/23.
//

import Foundation

struct Game: Codable {
    var teamId: Int
    var opponentId: Int
    var score: Int
    var opponentScore: Int
    var dayOfWeek: String
    var week: Int
    var season: Int
    var homeOrAway: String
    var isGameOver: Bool
    
    enum CodingKeys: String, CodingKey {
        case teamId = "TeamID"
        case opponentId = "OpponentID"
        case score = "Score"
        case opponentScore = "OpponentScore"
        case dayOfWeek = "DayOfWeek"
        case week = "Week"
        case season = "Season"
        case homeOrAway = "HomeOrAway"
        case isGameOver = "IsGameOver"
    }
}
