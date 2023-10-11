//
//  ViewController.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 9/28/23.
//

import UIKit

class RosterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkManagerDelegate {
    
    func presentAlert(with error: CBError) {
        let dialogMessage = UIAlertController(title: "OK", message: error.rawValue, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        dialogMessage.addAction(okButton)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func playersRetrieved(players: [Player]) {
        self.players = players
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    var players = [Player]()
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getPlayers()
        // Do any additional setup after loading the view.
    }
    
    func getPlayers() {
        NetworkManager.shared.getPlayers { result in
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
        content.secondaryText = position
        cell.contentConfiguration = content
        
        return cell
    }
    
}

