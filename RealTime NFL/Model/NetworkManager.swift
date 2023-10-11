//
//  NetworkManager.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 9/28/23.
//

import Foundation

protocol NetworkManagerDelegate {
    func playersRetrieved(players: [Player])
    func gameLogRetrieved(games: [Game])
}


class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.sportsdata.io/v3/nfl/scores/json/"
    private let apiKey = "?key=cd243264c2cf4c449a29d24f78ba8907"
    
    private init() {}
    
    func getPlayers(midUrl: String, completed: @escaping (Result<[Player], CBError>) -> Void) {
//        let tag = TeamViewController().tag
//        print(TeamViewController().tag)
        // if statement to handle either the rosterPressed or gameLogPressed functions accordingly.
        print(midUrl)
        if midUrl.contains("PlayersBasic") {
            //if true, the API request will fetch the roster for the selected team.
            let urlExtended = baseUrl + midUrl + apiKey
            guard let url = URL(string: urlExtended) else {
                completed(.failure(.invalidURL))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completed(.failure(.invalidData))
                    return
                }
                guard let data else {
                    completed(.failure(.invalidResponse))
                    return
                }
                let decoder = JSONDecoder()
                
                do {
                    let playersData = try decoder.decode([Player].self, from: data)
                    completed(.success(playersData))
                    return
                } catch {
                    print("Error during decoding, \(error)")
                    completed(.failure(.unableToComplete))
                    return
                }
            }
            
            task.resume()
            
        } else if midUrl.contains("TeamGameStatsBySeason") {
            //if true, the API request will fetch the game log for the selected team.
            //Note for future me: the teamId on the api site is 1 higher than the teamId established in the TeamsManager.
            //In order to retrieve the correct team log, use teamId += 1 for the request.
            let urlExtended = baseUrl + midUrl + apiKey
            guard let url = URL(string: urlExtended) else {
                completed(.failure(.invalidURL))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    completed(.failure(.invalidData))
                    return
                }
                guard let data else {
                    completed(.failure(.invalidResponse))
                    return
                }
                let decoder = JSONDecoder()
                
                do {
                    let playersData = try decoder.decode([Player].self, from: data)
                    completed(.success(playersData))
                    return
                } catch {
                    print("Error during decoding, \(error)")
                    completed(.failure(.unableToComplete))
                    return
                }
            }
            
            task.resume()
        }

    }
}
