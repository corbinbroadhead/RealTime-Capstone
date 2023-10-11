//
//  TeamViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/5/23.
//

import UIKit

class TeamViewController: UIViewController {

    let teams = TeamsManager.teams
    var tag: String = ""
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var gameLogButton: UIButton!
    
    @IBOutlet weak var rosterButton: UIButton!
    
    override func viewDidLoad() {
        let teamId = HomeViewController().teamId
        tag = HomeViewController().tag
        configureForTeam(for: teamId)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //perhaps this function is getting called before the view has loaded, so backgroundView is still nil at time of call
    func configureForTeam(for teamId: Int) {
        backgroundView.backgroundColor = teams[teamId].color
        gameLogButton.backgroundColor = UIColor.white
        rosterButton.backgroundColor = UIColor.white
        gameLogButton.titleLabel?.textColor = teams[teamId].color
        rosterButton.titleLabel?.textColor = teams[teamId].color
    }
    
    @IBAction func gameLogPressed(_ sender: Any) {
    }
    
    @IBAction func rosterPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RosterViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "teamVC")
        self.present(vc, animated: true)
    }
    
}
