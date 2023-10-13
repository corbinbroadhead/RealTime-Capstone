//
//  PlayerCell.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/13/23.
//

import UIKit

class PlayerCell: UITableViewCell {

    let teams = TeamsManager.teams

    static let identifier = "PlayerCell"
    
    private let player: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let number: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private let position: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(for player: String, whoPlays position: String, number: Int, teamId: Int) {
        self.backgroundColor = teams[teamId].textColor
        self.player.text = player
        self.player.textColor = teams[teamId].color
        self.number.text = "\(number)"
        self.number.textColor = teams[teamId].color
        self.position.text = position
        self.position.textColor = teams[teamId].color
    }
    
    private func setupUI() {
        self.contentView.addSubview(player)
        self.contentView.addSubview(number)
        self.contentView.addSubview(position)
        player.translatesAutoresizingMaskIntoConstraints = false
        number.translatesAutoresizingMaskIntoConstraints = false
        position.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            player.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            player.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            
            number.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 4),
            number.leadingAnchor.constraint(equalTo: self.player.trailingAnchor, constant: 10),
            
            position.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            position.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 352)
        ])
    }
    
}
