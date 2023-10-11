//
//  HomeViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/3/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    //setting teams to equal the teams array from the TeamsManager
    let teams = TeamsManager.teams
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
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
