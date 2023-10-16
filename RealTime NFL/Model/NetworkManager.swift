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
    func scoresRetrieved(scores: [Score])
}


class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.sportsdata.io/v3/nfl/scores/json/"
    private let apiKey = "?key=cd243264c2cf4c449a29d24f78ba8907"
    
    private init() {}
    
    func getPlayers(midUrl: String, completed: @escaping (Result<[Player], CBError>) -> Void) {
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
    
    func getGames(midUrl: String, completed: @escaping (Result<[Game], CBError>) -> Void) {
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
                let gameData = try decoder.decode([Game].self, from: data)
                completed(.success(gameData))
                return
            } catch {
                print("Error during decoding: \(error)")
                completed(.failure(.unableToComplete))
                return
            }
        }
        
        task.resume()
    }
    
    func getScores(midUrl: String, completed: @escaping (Result<[Score], CBError>) -> Void) {
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
                let scoreData = try decoder.decode([Score].self, from: data)
                completed(.success(scoreData))
                return
            } catch {
                print("Error during decoding: \(error)")
                completed(.failure(.unableToComplete))
                return
            }
        }
        task.resume()
    }
    
    func getWeek(completed: @escaping (Result<Int, CBError>) -> Void) {
        guard let url = URL(string: "https://api.sportsdata.io/v3/nfl/scores/json/CurrentWeek?key=cd243264c2cf4c449a29d24f78ba8907") else {
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
            
            let stringInt = String.init(data: data, encoding: String.Encoding.utf8)
            let int = Int.init(stringInt ?? "")
            completed(.success(int!))
            return
        }
        task.resume()
    }
}
