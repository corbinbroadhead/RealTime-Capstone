//
//  Player.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 9/28/23.
//

import Foundation

struct Player: Codable {
    var playerId: Int
    var team: String
    var number: Int?
    var lastName: String
    var firstName: String
    var position: String
    
    enum CodingKeys: String, CodingKey {
        case playerId = "PlayerID"
        case team = "Team"
        case number = "Number"
        case lastName = "LastName"
        case firstName = "FirstName"
        case position = "Position"
    }
}

//struct PlayerResponse: Codable {
//    var data: [Player]
//}
