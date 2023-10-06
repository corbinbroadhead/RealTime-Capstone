//
//  NetworkManager.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 9/28/23.
//

import Foundation

protocol NetworkManagerDelegate {
    func playersRetrieved(players: [Player])
}

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.sportsdata.io/v3/nfl/scores/json/"
    private let apiKey = "key=cd243264c2cf4c449a29d24f78ba8907"
    
    private init() {}

    func getPlayers(completed: @escaping (Result<[Player], CBError>) -> Void) {
        let urlExtended = baseUrl + "PlayersBasic/DAL?" + apiKey
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
