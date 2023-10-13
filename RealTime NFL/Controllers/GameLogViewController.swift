//
//  GameLogViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/10/23.
//

import UIKit

class GameLogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkManagerDelegate {
    
    //MARK: Alert Management
    //presenting an alert if there was an error when retrieving the data
    func presentAlert(with error: CBError) {
        // creating a dialogMessage variable as a UIAlertController
        let dialogMessage = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
        // creating the action for when the "ok" button is tapped
        let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        //adding the okButton action to the alert
        dialogMessage.addAction(okButton)
        //presenting the alert
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    //MARK: Game Log Retrieved Function
    //handling when the game data is retrieved
    func gameLogRetrieved(games: [Game]) {
        //setting the games variable (previously an empty array of game objects) to the data retrieved
        self.games = games
        //having the view reload the data to update to display the necessary information
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: Declaration of variables and IB Outlets
    //creating a temporary images array with pictures of MLS players
    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!
    ]
    //creating a variable that will be passed into our NetworkManager as the core of the URL
    var midUrl = String()
    //creating our instance of the teams array from TeamsManager
    let teams = TeamsManager.teams
    //creating a games variable to hold an array of Game objects
    var games = [Game]()
    
    var teamId: Int
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: GameLogViewController Initializers
    init?(coder: NSCoder, teamId: Int) {
        self.teamId = teamId
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        addCell()
        //creating a new variable so that the teamId matches the API's teamId
//        let adjustedTeamId = teamId + 1
        //creating a variable that will hold the core of our API request url
        midUrl = "TeamGameStatsBySeason/2023/" + String(teams[teamId].apiTeamId) + "/all"
        //configuring the UI to match the selected team
        configureForTeam(for: teamId)
        tableView.delegate = self
        tableView.dataSource = self
        //our function that will make the API request
        getGames(midUrl: midUrl)
    }
    
    //MARK: UI Configuration
    func configureForTeam(for teamId: Int) {
        backgroundView.backgroundColor = teams[teamId].textColor
        
        cityLabel.textColor = teams[teamId].color
        cityLabel.text = teams[teamId].city
        
        nameLabel.textColor = teams[teamId].color
        nameLabel.text = teams[teamId].name
    }
    
    //MARK: Get Games Function
    func getGames(midUrl: String) {
        //making our API request
        NetworkManager.shared.getGames(midUrl: midUrl) { result in
            switch result {
            case .success(let games):
                self.gameLogRetrieved(games: games)
            case .failure(let error):
                self.presentAlert(with: error)
            }
        }
    }
    
    //MARK: Table View Methods
    func addCell() {
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a basic reusable cell under the name "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.identifier, for: indexPath) as? GameCell else {
            fatalError("The table view could not dequeue a custom cell in GameLogViewController")
        }
        
        //The team IDs on the API are formatted out of order. In order to properly sort the results we get back, we are using a function made up of a switch statement.
        let teamId = teamIdSorter(api: games[indexPath.row].teamId)
        let opponentId = teamIdSorter(api: games[indexPath.row].opponentId)
        let dayAndWeek = "\(games[indexPath.row].dayOfWeek), Week \(games[indexPath.row].week)"
        var finalOrInProgress: String = ""
        var awayId: Int = 0
        var homeId: Int = 0
        var awayScore: String = ""
        var homeScore: String = ""
        
        if games[indexPath.row].isGameOver == true {
            finalOrInProgress = "FINAL"
        } else {
            finalOrInProgress = "IN PROGRESS"
        }
        
        if games[indexPath.row].homeOrAway == "HOME" {
            homeId = teamId
            awayId = opponentId
            homeScore = String(games[indexPath.row].score)
            awayScore = String(games[indexPath.row].opponentScore)
        } else {
            homeId = opponentId
            awayId = teamId
            homeScore = String(games[indexPath.row].opponentScore)
            awayScore = String(games[indexPath.row].score)
        }
        
        let image = self.images[indexPath.row]
        cell.configure(teamLogo: image, awayScore: awayScore, homeScore: homeScore, finalOrInProgress: finalOrInProgress, awayId: awayId, homeId: homeId, dayAndWeek: dayAndWeek)
//        print(games[0].teamId)
//        print(games[0].dayOfWeek)
//        print(games[0].isGameOver)
//        let name = "\(games[indexPath.row].score)"
//        let position = "\(games[indexPath.row].opponentScore)"
//        var content = cell.defaultContentConfiguration()
//
//        content.text = name
//        cell.backgroundColor = UIColor.white
//        content.secondaryText = position
//        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //makes the cell return to usual after selected
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Players Retrieved Func - I do not need this in this file
    func playersRetrieved(players: [Player]) {
        print("I do not need this func for the GameLogViewController")
    }
}

extension GameLogViewController {
    func teamIdSorter(api apiTeamId: Int) -> Int {
        var newId: Int = 0
        switch apiTeamId {
        case 35:
            newId = 31
        case 34:
            newId = 30
        case 33:
            newId = 29
        case 30:
            newId = 28
        case 31:
            newId = 27
        case 28:
            newId = 26
        case 24:
            newId = 24
        case 23:
            newId = 23
        case 22:
            newId = 22
        case 21:
            newId = 21
        case 20:
            newId = 20
        case 19:
            newId = 19
        case 32:
            newId = 18
        case 29:
            newId = 17
        case 25:
            newId = 16
        default:
            newId = apiTeamId - 1
        }
        return newId
    }
}
