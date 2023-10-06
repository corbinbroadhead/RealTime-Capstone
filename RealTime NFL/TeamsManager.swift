//
//  TeamsManager.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/5/23.
//

import UIKit

class TeamsManager {
    let cardinals = Team(city: "Arizona", name: "Cardinals", abv: "ARI", color: UIColor(red: 151/255, green: 35/255, blue: 63/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let falcons = Team(city: "Atlanta", name: "Falcons", abv: "ATL", color: UIColor(red: 167/255, green: 25/255, blue: 48/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let ravens = Team(city: "Baltimore", name: "Ravens", abv: "BAL", color: UIColor(red: 36/255, green: 23/255, blue: 115/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let bills = Team(city: "Buffalo", name: "Bills", abv: "BUF", color: UIColor(red: 0/255, green: 51/255, blue: 141/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let panthers = Team(city: "Carolina", name: "Panthers", abv: "CAR", color: UIColor(red: 0/255, green: 133/255, blue: 202/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let bears = Team(city: "Chicago", name: "Bears", abv: "CHI", color: UIColor(red: 11/255, green: 22/255, blue: 42/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let bengals = Team(city: "Cincinnati", name: "Bengals", abv: "CIN", color: UIColor(red: 251/255, green: 79/255, blue: 20/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let browns = Team(city: "Cleveland", name: "Browns", abv: "CLE", color: UIColor(red: 255/255, green: 60/255, blue: 0/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let cowboys = Team(city: "Dallas", name: "Cowboys", abv: "DAL", color: UIColor(red: 0/255, green: 53/255, blue: 148/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let broncos = Team(city: "Denver", name: "Broncos", abv: "DEN", color: UIColor(red: 0/255, green: 34/255, blue: 68/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let lions = Team(city: "Detroit", name: "Lions", abv: "DET", color: UIColor(red: 0/255, green: 118/255, blue: 182/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let packers = Team(city: "Green Bay", name: "Packers", abv: "GB", color: UIColor(red: 32/255, green: 55/255, blue: 49/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let texans = Team(city: "Houston", name: "Texans", abv: "HOU", color: UIColor(red: 3/255, green: 32/255, blue: 47/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let colts = Team(city: "Indianapolis", name: "Colts", abv: "IND", color: UIColor(red: 0/255, green: 44/255, blue: 95/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let jaguars = Team(city: "Jacksonville", name: "Jaguars", abv: "JAX", color: UIColor(red: 0/255, green: 103/255, blue: 120/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let chiefs = Team(city: "Kansas City", name: "Chiefs", abv: "KC", color: UIColor(red: 227/255, green: 24/255, blue: 55/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let raiders = Team(city: "Las Vegas", name: "Raiders", abv: "LV", color: UIColor(red: 165/255, green: 172/255, blue: 175/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let chargers = Team(city: "Los Angeles", name: "Chargers", abv: "LAC", color: UIColor(red: 0/255, green: 128/255, blue: 198/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let rams = Team(city: "Los Angeles", name: "Rams", abv: "LAR", color: UIColor(red: 0/255, green: 53/255, blue: 148/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let dolphins = Team(city: "Miami", name: "Dolphins", abv: "MIA", color: UIColor(red: 0/255, green: 142/255, blue: 151/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let vikings = Team(city: "Minnesota", name: "Vikings", abv: "MIN", color: UIColor(red: 79/255, green: 38/255, blue: 131/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let patriots = Team(city: "New England", name: "Patriots", abv: "NE", color: UIColor(red: 0/255, green: 34/255, blue: 68/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let saints = Team(city: "New Orleans", name: "Saints", abv: "NO", color: UIColor(red: 211/255, green: 188/255, blue: 141/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let giants = Team(city: "New York", name: "Giants", abv: "NYG", color: UIColor(red: 11/255, green: 34/255, blue: 101/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let jets = Team(city: "New York", name: "Jets", abv: "NYJ", color: UIColor(red: 18/255, green: 87/255, blue: 64/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let eagles = Team(city: "Philadelphia", name: "Eagles", abv: "PHI", color: UIColor(red: 0/255, green: 76/255, blue: 84/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let steelers = Team(city: "Pittsburgh", name: "Steelers", abv: "PIT", color: UIColor(red: 255/255, green: 182/255, blue: 18/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let niners = Team(city: "San Francisco", name: "49ers", abv: "SF", color: UIColor(red: 170/255, green: 0/255, blue: 0/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let seahawks = Team(city: "Seattle", name: "Seahawks", abv: "SEA", color: UIColor(red: 105/255, green: 190/255, blue: 40/255, alpha: 1.00), textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    let buccaneers = Team(city: "Tampa Bay", name: "Buccaneers", abv: "TB", color: UIColor(red: 213/255, green: 10/255, blue: 10/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let titans = Team(city: "Tennessee", name: "Titans", abv: "TEN", color: UIColor(red: 75/255, green: 146/255, blue: 219/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    let commanders = Team(city: "Washington", name: "Commanders", abv: "WSH", color: UIColor(red: 90/255, green: 20/255, blue: 20/255, alpha: 1.00), textColor: UIColor(white: 1.0, alpha: 1.0))
    
    static let teams = [TeamsManager().cardinals, TeamsManager().falcons, TeamsManager().ravens, TeamsManager().bills, TeamsManager().panthers, TeamsManager().bears, TeamsManager().bengals, TeamsManager().browns, TeamsManager().cowboys, TeamsManager().broncos, TeamsManager().lions, TeamsManager().packers, TeamsManager().texans, TeamsManager().colts, TeamsManager().jaguars, TeamsManager().chiefs, TeamsManager().raiders, TeamsManager().chargers, TeamsManager().rams, TeamsManager().dolphins, TeamsManager().vikings, TeamsManager().patriots, TeamsManager().saints, TeamsManager().giants, TeamsManager().jets, TeamsManager().eagles, TeamsManager().steelers, TeamsManager().niners, TeamsManager().seahawks, TeamsManager().buccaneers, TeamsManager().titans, TeamsManager().commanders]
    
}


