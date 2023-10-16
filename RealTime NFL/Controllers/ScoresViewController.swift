//
//  ScoresViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/13/23.
//

import UIKit

class ScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkManagerDelegate {
    
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
        DispatchQueue.main.async {
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    //MARK: Scores Retrieved Function
    //handling when the game data is retrieved
    func scoresRetrieved(scores: [Score]) {
        //setting the games variable (previously an empty array of game objects) to the data retrieved
        self.scores = scores
        //having the view reload the data to update to display the necessary information
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
//    var midUrl = String()
    
    var scores = [Score]()
    
    let teams = TeamsManager.teams
    
    var week: Int
    
    @IBOutlet weak var weekLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureForWeek(for: week)
        tableView.delegate = self
        tableView.dataSource = self
        addCell()
        let midUrl: String = "ScoresBasic/2023/\(week)"
        getScores(midUrl: midUrl)
    }
    
    //HomeViewController will have to make the api call to retrieve the week once the btn is pressed, then it will pass it to the scoresVC through the initializer. This way the scoresVC will have it before the view loads (hopefully).
    
    //MARK: ScoresViewController Initializers
    init?(coder: NSCoder, week: Int) {
        self.week = week
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getScores(midUrl: String) {
        //making our API request
        NetworkManager.shared.getScores(midUrl: midUrl) { result in
            switch result {
            case .success(let scores):
                self.scoresRetrieved(scores: scores)
            case .failure(let error):
                self.presentAlert(with: error)
            }
        }
    }
    
    func configureForWeek(for week: Int) {
        weekLabel.text = "Week " + String(week)
    }
    
    //MARK: Table Veiw Methods
    func addCell() {
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a basic reusable cell under the name "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.identifier, for: indexPath) as? GameCell else {
            fatalError("The table view could not dequeue a custom cell in ScoresViewController")
        }
        
        //The team IDs on the API are formatted out of order. In order to properly sort the results we get back, we are using a function made up of a switch statement.
        let awayTeamId = teamIdSorter(api: scores[indexPath.row].awayTeamId)
        let homeTeamId = teamIdSorter(api: scores[indexPath.row].homeTeamId)
        var dayAndWeek = String()
        var awayScore = String()
        var homeScore = String()
        var status = scores[indexPath.row].status
        
        if scores[indexPath.row].quarter != nil {
            dayAndWeek = "Quarter: \(scores[indexPath.row].quarter!)"
        } else {
            dayAndWeek = "Not Started"
        }

        if scores[indexPath.row].homeScore != nil {
            homeScore = "\(scores[indexPath.row].homeScore!)"
        } else {
            homeScore = "0"
        }
        
        if scores[indexPath.row].awayScore != nil {
            awayScore = "\(scores[indexPath.row].awayScore!)"
        } else {
            awayScore = "0"
        }
        
        if status == "Final" {
            status = "FINAL"
        } else if status == "InProgress" {
            status = "IN PROGRESS"
        } else {
            status = "SCHEDULED"
        }
        
    
        cell.configure(awayScore: awayScore, homeScore: homeScore, finalOrInProgress: status, awayId: awayTeamId, homeId: homeTeamId, dayAndWeek: dayAndWeek)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115.5
    }

    //MARK: Required Delegate Funcs
    func playersRetrieved(players: [Player]) {
        print("I don't need this")
    }

    func gameLogRetrieved(games: [Game]) {
        print("I don't need this")
    }

}

extension ScoresViewController {
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
