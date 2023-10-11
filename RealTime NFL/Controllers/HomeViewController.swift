//
//  HomeViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/3/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let teamViewController = TeamViewController()
    //setting teams to equal the teams array from the TeamsManager
    let teams = TeamsManager.teams
    //setting tag as an empty String variable. This will be passed through the controllers and eventually to the NetworkManager as part of the api
    var tag: String = ""
    //setting the teamId as an empty Int. Will be used as the index of the teams array that the selected team is at.
    var teamId = Int()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //setting the number of rows in the table view equal to the number of teams in the 'teams' array.
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating 'cell' as an instance of the reusable cell tag for a table view.
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTeamSelectCell", for: indexPath)
        //creating the text for the team name that will be assigned as the text of the cell's content
        let name = "\(teams[indexPath.row].city) \(teams[indexPath.row].name)"
        
        var content = cell.defaultContentConfiguration()
        
        //        cell.textLabel?.textColor = UIColor.white
        //       if cell.textLabel == nil {
        //            print("I'm nil")
        //        }
        
        content.text = name
        cell.contentConfiguration = content
        cell.backgroundColor = teams[indexPath.row].color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //setting the teamId equal to the corresponding teamId in the teams array.
        teamId = teams[indexPath.row].teamId
        //calling the configureForTeam function from teamViewController, passing in the teamId
        teamViewController.configureForTeam(for: teamId)
        //setting the tag equal to the corresponding abv for the team
        tag = teams[teamId].abv
        //instantiating the teamViewController
        let storyboard = UIStoryboard(name: "TeamViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "teamVC")
        self.present(vc, animated: true)
    }
}
