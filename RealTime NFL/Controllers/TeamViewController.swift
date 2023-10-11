//
//  TeamViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/5/23.
//

import UIKit

class TeamViewController: UIViewController {

    let teams = TeamsManager.teams
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var gameLogButton: UIButton!
    
    @IBOutlet weak var rosterButton: UIButton!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var teamId: Int
    var tag: String
    
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
    
    func configureForTeam(for teamId: Int) {
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
    
    @IBAction func gameLogPressed(_ sender: Any) {
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
