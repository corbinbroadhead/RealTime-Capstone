//
//  Game.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/10/23.
//

import UIKit

class Game {
    var teamId = Int()
    var opponentId = Int()
    var score = Int()
    var opponentScore = Int()
    var dayOfWeek = String()
    var week = Int()
    var season = Int()
    var homeOrAway = String()
    var isGameOver = Bool()
    
    init(teamId: Int, opponentId: Int, score: Int, opponentScore: Int, dayOfWeek: String, week: Int, season: Int, homeOrAway: String, isGameOver: Bool) {
        self.teamId = teamId
        self.opponentId = opponentId
        self.score = score
        self.opponentScore = opponentScore
        self.dayOfWeek = dayOfWeek
        self.week = week
        self.season = season
        self.homeOrAway = homeOrAway
        self.isGameOver = isGameOver
    }
}
