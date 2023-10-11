//
//  ViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 9/28/23.
//

import UIKit

class RosterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkManagerDelegate {
    
    
//MARK: Alert Management
    //presenting an alert if there was an error when retrieving the data
    func presentAlert(with error: CBError) {
        // creating a dialogMessage variable as a UIAlertController
        let dialogMessage = UIAlertController(title: "OK", message: error.rawValue, preferredStyle: .alert)
        // creating the action for when the "ok" button is tapped
        let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        //adding the okButton action to the alert
        dialogMessage.addAction(okButton)
        //presenting the alert
        self.present(dialogMessage, animated: true, completion: nil)
    }
    

//MARK: Players Retrieved Function
    //handling when the player data is retrieved
    func playersRetrieved(players: [Player]) {
        //setting the players variable (previously an empty array of player objects) to the data retrieved
        self.players = players
        //having the view reload the data to update to display the necessary information
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
//MARK: Establishing Variables and IBOutlets
    //creating a variable that will be passed into our NetworkManager as the core of the URL
    var midUrl = String()
    
    var players = [Player]()
    
    let teams = TeamsManager.teams
    
    var teamId: Int
    
    var tag: String
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    

//MARK: RosterViewController Initializers
    init?(coder: NSCoder, teamId: Int, tag: String) {
        self.teamId = teamId
        self.tag = tag
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        midUrl = "PlayersBasic/" + tag
        configureForTeam(for: teamId)
        tableView.delegate = self
        tableView.dataSource = self
        getPlayers(midUrl: midUrl)
    }
    
    func configureForTeam(for teamId: Int) {
        backgroundView.backgroundColor = teams[teamId].textColor

        cityLabel.textColor = teams[teamId].color
        cityLabel.text = teams[teamId].city

        nameLabel.textColor = teams[teamId].color
        nameLabel.text = teams[teamId].name
//
//        gameLogButton.backgroundColor = UIColor.white
//        gameLogButton.setTitleColor(teams[teamId].color, for: .normal)
//        gameLogButton.layer.cornerRadius = 12
//
//        rosterButton.backgroundColor = UIColor.white
//        rosterButton.setTitleColor(teams[teamId].color, for: .normal)
//        rosterButton.layer.cornerRadius = 12
    }
    
//MARK: Get Players Function
    func getPlayers(midUrl: String) {
        NetworkManager.shared.getPlayers(midUrl: midUrl) { result in
            switch result {
            case .success(let players):
                self.playersRetrieved(players: players)
            case .failure(let error):
                self.presentAlert(with: error)
            }
        }
    }
    

//MARK: Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RosterPlayerCell", for: indexPath)
        let name = "\(players[indexPath.row].firstName) \(players[indexPath.row].lastName)"
        let position = players[indexPath.row].position
        var content = cell.defaultContentConfiguration()
        
        content.text = name
        cell.backgroundColor = teams[teamId].color
        content.secondaryText = position
        cell.contentConfiguration = content
        
        return cell
    }
    
//MARK: Game Log Retrieved Func - I do not need this
    func gameLogRetrieved(games: [Game]) {
        print("I do not need this func for the RosterViewController")
    }
}

