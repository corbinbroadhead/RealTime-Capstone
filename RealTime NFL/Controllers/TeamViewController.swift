//
//  TeamViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/5/23.
//

import UIKit

class TeamViewController: UIViewController {
    
    //MARK: Creating Variables & IBOutlets
    let teams = TeamsManager.teams
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var gameLogButton: UIButton!
    
    @IBOutlet weak var rosterButton: UIButton!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var logoView: UIImageView!
    
    //The teamId is the same as the index of the corresponding team in the teams array.
    var teamId: Int
    //The tag will be used to pass the correct team into the API request.
    var tag: String
    
    //MARK: View Controller Initializer
    init?(coder: NSCoder, teamId: Int, tag: String) {
        self.teamId = teamId
        self.tag = tag
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureForTeam(for: teamId)
    }
    
    //MARK: View Controller Configuration
    //This function will make the UI look like the selected team's branding. The names, colors, and logo will be correct.
    func configureForTeam(for teamId: Int) {
        logoView.image = teams[teamId].logo
        
        backgroundView.backgroundColor = teams[teamId].color
        
        cityLabel.textColor = teams[teamId].textColor
        cityLabel.text = teams[teamId].city
        
        nameLabel.textColor = teams[teamId].textColor
        nameLabel.text = teams[teamId].name
        
        gameLogButton.backgroundColor = UIColor.white
        gameLogButton.setTitleColor(teams[teamId].color, for: .normal)
        gameLogButton.layer.cornerRadius = 12
        
        rosterButton.backgroundColor = UIColor.white
        rosterButton.setTitleColor(teams[teamId].color, for: .normal)
        rosterButton.layer.cornerRadius = 12
    }
    
    //MARK: IBOutlet Actions
    @IBAction func gameLogPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "gameLogVC", creator: { coder in
            return GameLogViewController(coder: coder, teamId: self.teamId)
        }) else {
            fatalError("Failed to load GameLogViewController from storyboard.")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func rosterPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "rosterVC", creator: { coder in
            return RosterViewController(coder: coder, teamId: self.teamId, tag: self.tag)
        }) else {
            fatalError("Failed to load RosterViewController from storyboard.")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
