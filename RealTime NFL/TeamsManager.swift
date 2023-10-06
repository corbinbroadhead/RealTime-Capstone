//
//  TeamsManager.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/5/23.
//

import UIKit

class TeamsManager {
    static let cardinals = Team(city: "Arizona", name: "Cardinals", abv: "ARI", color: UIColor(red: 151/255, green: 35/255, blue: 63/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 1)
    static let falcons = Team(city: "Atlanta", name: "Falcons", abv: "ATL", color: UIColor(red: 167/255, green: 25/255, blue: 48/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 2)
    static let ravens = Team(city: "Baltimore", name: "Ravens", abv: "BAL", color: UIColor(red: 36/255, green: 23/255, blue: 115/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 3)
    static let bills = Team(city: "Buffalo", name: "Bills", abv: "BUF", color: UIColor(red: 0/255, green: 51/255, blue: 141/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 4)
    static let panthers = Team(city: "Carolina", name: "Panthers", abv: "CAR", color: UIColor(red: 0/255, green: 133/255, blue: 202/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 5)
    static let bears = Team(city: "Chicago", name: "Bears", abv: "CHI", color: UIColor(red: 11/255, green: 22/255, blue: 42/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 6)
    static let bengals = Team(city: "Cincinnati", name: "Bengals", abv: "CIN", color: UIColor(red: 251/255, green: 79/255, blue: 20/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 7)
    static let browns = Team(city: "Cleveland", name: "Browns", abv: "CLE", color: UIColor(red: 255/255, green: 60/255, blue: 0/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 8)
    static let cowboys = Team(city: "Dallas", name: "Cowboys", abv: "DAL", color: UIColor(red: 0/255, green: 53/255, blue: 148/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 9)
    static let broncos = Team(city: "Denver", name: "Broncos", abv: "DEN", color: UIColor(red: 0/255, green: 34/255, blue: 68/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 10)
    static let lions = Team(city: "Detroit", name: "Lions", abv: "DET", color: UIColor(red: 0/255, green: 118/255, blue: 182/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 11)
    static let packers = Team(city: "Green Bay", name: "Packers", abv: "GB", color: UIColor(red: 32/255, green: 55/255, blue: 49/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 12)
    static let texans = Team(city: "Houston", name: "Texans", abv: "HOU", color: UIColor(red: 3/255, green: 32/255, blue: 47/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 13)
    static let colts = Team(city: "Indianapolis", name: "Colts", abv: "IND", color: UIColor(red: 0/255, green: 44/255, blue: 95/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 14)
    static let jaguars = Team(city: "Jacksonville", name: "Jaguars", abv: "JAX", color: UIColor(red: 0/255, green: 103/255, blue: 120/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 15)
    static let chiefs = Team(city: "Kansas City", name: "Chiefs", abv: "KC", color: UIColor(red: 227/255, green: 24/255, blue: 55/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 16)
    static let raiders = Team(city: "Las Vegas", name: "Raiders", abv: "LV", color: UIColor(red: 165/255, green: 172/255, blue: 175/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 17)
    static let chargers = Team(city: "Los Angeles", name: "Chargers", abv: "LAC", color: UIColor(red: 0/255, green: 128/255, blue: 198/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 18)
    static let rams = Team(city: "Los Angeles", name: "Rams", abv: "LAR", color: UIColor(red: 0/255, green: 53/255, blue: 148/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 19)
    static let dolphins = Team(city: "Miami", name: "Dolphins", abv: "MIA", color: UIColor(red: 0/255, green: 142/255, blue: 151/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 20)
    static let vikings = Team(city: "Minnesota", name: "Vikings", abv: "MIN", color: UIColor(red: 79/255, green: 38/255, blue: 131/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 21)
    static let patriots = Team(city: "New England", name: "Patriots", abv: "NE", color: UIColor(red: 0/255, green: 34/255, blue: 68/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 22)
    static let saints = Team(city: "New Orleans", name: "Saints", abv: "NO", color: UIColor(red: 211/255, green: 188/255, blue: 141/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 23)
    static let giants = Team(city: "New York", name: "Giants", abv: "NYG", color: UIColor(red: 11/255, green: 34/255, blue: 101/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 24)
    static let jets = Team(city: "New York", name: "Jets", abv: "NYJ", color: UIColor(red: 18/255, green: 87/255, blue: 64/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 25)
    static let eagles = Team(city: "Philadelphia", name: "Eagles", abv: "PHI", color: UIColor(red: 0/255, green: 76/255, blue: 84/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 26)
    static let steelers = Team(city: "Pittsburgh", name: "Steelers", abv: "PIT", color: UIColor(red: 255/255, green: 182/255, blue: 18/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 27)
    static let niners = Team(city: "San Francisco", name: "49ers", abv: "SF", color: UIColor(red: 170/255, green: 0/255, blue: 0/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 28)
    static let seahawks = Team(city: "Seattle", name: "Seahawks", abv: "SEA", color: UIColor(red: 105/255, green: 190/255, blue: 40/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), teamId: 29)
    static let buccaneers = Team(city: "Tampa Bay", name: "Buccaneers", abv: "TB", color: UIColor(red: 213/255, green: 10/255, blue: 10/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 30)
    static let titans = Team(city: "Tennessee", name: "Titans", abv: "TEN", color: UIColor(red: 75/255, green: 146/255, blue: 219/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 31)
    static let commanders = Team(city: "Washington", name: "Commanders", abv: "WSH", color: UIColor(red: 90/255, green: 20/255, blue: 20/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0), teamId: 32)
    
    static let teams = [cardinals, falcons, ravens, bills, panthers, bears, bengals, browns, cowboys, broncos, lions, packers, texans, colts, jaguars, chiefs, raiders, chargers, rams, dolphins, vikings, patriots, saints, giants, jets, eagles, steelers, niners, seahawks, buccaneers, titans, commanders]
}


