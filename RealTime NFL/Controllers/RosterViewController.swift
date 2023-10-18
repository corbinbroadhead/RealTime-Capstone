//
//  ViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 9/28/23.
//

import UIKit

class RosterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    //this will be our array of Player objects
    var players = [Player]()
    
    let teams = TeamsManager.teams
    
    var teamId: Int
    
    var tag: String
    
    @IBOutlet weak var logoView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var backgroundView: UIView!
    
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
        
        addCell()
        midUrl = "PlayersBasic/" + tag
        configureForTeam(for: teamId)
        tableView.delegate = self
        tableView.dataSource = self
        getPlayers(midUrl: midUrl)
    }
    
    //MARK: UI Design
    //This function will make the UI look like the selected team's branding. The names, colors, and logo will be correct.
    func configureForTeam(for teamId: Int) {
        backgroundView.backgroundColor = teams[teamId].color
         
        logoView.image = teams[teamId].logo

        nameLabel.textColor = teams[teamId].textColor
        nameLabel.text = "\(teams[teamId].city) \(teams[teamId].name)"
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
    func addCell() {
        tableView.register(PlayerCell.self, forCellReuseIdentifier: PlayerCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier, for: indexPath) as? PlayerCell else {
            fatalError("Unable to populate table view with PlayerCell cells in RosterViewController.")
        }
        
        let name = "\(players[indexPath.row].firstName) \(players[indexPath.row].lastName)"
        let position = players[indexPath.row].position
        let number = players[indexPath.row].number ?? 0
        
        cell.configure(for: name, whoPlays: position, number: number, teamId: self.teamId)
        
        return cell
    }
}

