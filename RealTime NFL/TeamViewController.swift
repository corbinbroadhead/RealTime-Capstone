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
    
    override func viewDidLoad() {
        let teamId = HomeViewController().teamId
        configureForTeam(for: teamId)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configureForTeam(for teamId: Int) {
        backgroundView.backgroundColor = teams[teamId].color
    }
}
