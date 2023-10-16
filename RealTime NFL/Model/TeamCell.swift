//
//  TeamCell.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/13/23.
//

import UIKit

class TeamCell: UITableViewCell {

    let teams = TeamsManager.teams

    static let identifier = "TeamCell"
    
    private let logo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let team: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
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
    
    public func configure(teamId: Int) {
        self.backgroundColor = teams[teamId].color
        self.logo.image = teams[teamId].logo
        self.team.text = "\(teams[teamId].city) \(teams[teamId].name)"
        self.team.textColor = UIColor(white: 1.0, alpha: 1.0)
    }
    
    private func setupUI() {
        self.contentView.addSubview(logo)
        self.contentView.addSubview(team)
        logo.translatesAutoresizingMaskIntoConstraints = false
        team.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            logo.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            logo.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            logo.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),

            logo.widthAnchor.constraint(equalToConstant: 72),

            team.leadingAnchor.constraint(equalTo: self.logo.leadingAnchor, constant: 70),
            team.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            team.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
        ])
    }

}
