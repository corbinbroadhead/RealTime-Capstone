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
    
    let teams = TeamsManager.teams
    
    var teamId = Int()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTeamSelectCell", for: indexPath)
        let name = "\(teams[indexPath.row].city) \(teams[indexPath.row].name)"
        var content = cell.defaultContentConfiguration()
        
        //        cell.textLabel?.textColor = UIColor.white
        //        if cell.textLabel == nil {
        //            print("I'm nil")
        //        }
        
        content.text = name
        cell.contentConfiguration = content
        cell.backgroundColor = teams[indexPath.row].color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        teamId = teams[indexPath.row].teamId
//        teamViewController.configureForTeam(for: teamId)
//        let teamViewController = TeamViewController()
//        self.navigationController?.pushViewController(teamViewController, animated: true)
        let storyboard = UIStoryboard(name: "TeamViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "teamVC")
        self.present(vc, animated: true)
    }
}
