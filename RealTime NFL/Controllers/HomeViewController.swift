//
//  HomeViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/3/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    //MARK: Week Retrieved Function
    //handling when the game data is retrieved
    func weekRetrieved(week: Int) {
        //setting the games variable (previously an empty array of game objects) to the data retrieved
        self.currentWeek = week
        //having the view reload the data to update to display the necessary information
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewScoresButton: UIButton!
    
    //setting teams to equal the teams array from the TeamsManager
    let teams = TeamsManager.teams
    
    var currentWeek = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calling the getWeek function so it has time to get a return value before the user attempts to click the score button
        getWeek()
        addCell()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: Handling ViewScoresPressed
    @IBAction func viewScoresPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "scoresVC", creator: { coder in
            return ScoresViewController(coder: coder, week: self.currentWeek)
        }) else {
            fatalError("Failed to load ScoresViewController from storyboard.")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getWeek() {
        //making our API request
        NetworkManager.shared.getWeek() { result in
            switch result {
            case .success(let week):
                self.currentWeek = week
            case .failure(let error):
                self.presentAlert(with: error)
            }
        }
    }
    
    
    //MARK: Table View Methods
    func addCell() {
        tableView.register(TeamCell.self, forCellReuseIdentifier: TeamCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //setting the number of rows in the table view equal to the number of teams in the 'teams' array.
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating 'cell' as an instance of the reusable cell tag for a table view.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.identifier, for: indexPath) as? TeamCell else {
            fatalError("Unable to populate table view with TeamCell cells in Home View Controller.")
        }
        
        let teamId = teams[indexPath.row].teamId
        
        cell.configure(teamId: teamId)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //makes the cell return to usual after selected
        tableView.deselectRow(at: indexPath, animated: true)
        //setting a teamId equal to the corresponding teamId in the teams array.
        let teamId = teams[indexPath.row].teamId
        //setting a tag equal to the corresponding abv for the team
        let tag = teams[teamId].abv
        //instantiating the teamViewController
        guard let vc = storyboard?.instantiateViewController(identifier: "teamVC", creator: { coder in
            return TeamViewController(coder: coder, teamId: teamId, tag: tag)
        }) else {
            fatalError("Failed to load TeamViewController from storyboard.")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
