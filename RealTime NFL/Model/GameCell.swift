//
//  GameCell.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/12/23.
//

import UIKit

class GameCell: UITableViewCell {
    
    let teams = TeamsManager.teams

    static let identifier = "GameCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let myImageView2: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let awayScore: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let awayAbv: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let homeScore: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let homeAbv: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let finalOrInProgress: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let dayAndWeek: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .medium)
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
    
    //make this function take in the teamId, and set the image equal to teams[teamId].logo (you still need to create this for all the teams) and the label text color to teams[teamId].color
    //the isGameOver should assign a label to "FINAL" if true and "IN PROGRESS" if false in the bottom left.
    //the week number and dayOfWeek should combine to read like, "Sunday, Week 13" in the bottom right.
    //home team displayed on left, away team displayed on right
    //overall, this function will eventually have to take in: teamId, opponentId, score, opponentScore, isGameOver, and a String that is comprised of "\(dayOfWeek), Week \(week)"
    //use the teamId to get the team logo and colors, and the same goes for opponent logo and colors. We will need to do a switch statement which will check if the team is at home or away, then assign the properties to the correct side as necessary
//    public func configure(teamLogo image: UIImage, teamScore label: String, finalIndicator: String) {
//        self.myImageView.image = image
//        self.awayScore.text = label
//        self.awayScore.textColor = teams[8].color
//        self.finalOrInProgress.text = finalIndicator
//    }
    public func configure(teamLogo image: UIImage, awayScore: String, homeScore: String, finalOrInProgress finalIndicator: String, awayId away: Int, homeId home: Int, dayAndWeek: String) {
        self.myImageView.image = image
        self.myImageView2.image = image
        self.awayScore.text = awayScore
        self.awayScore.textColor = teams[away].color
        self.homeScore.text = homeScore
        self.homeScore.textColor = teams[home].color
        self.awayAbv.text = teams[away].abv
        self.awayAbv.textColor = teams[away].color
        self.homeAbv.text = teams[home].abv
        self.homeAbv.textColor = teams[home].color
        self.finalOrInProgress.text = finalIndicator
        self.dayAndWeek.text = dayAndWeek
    }
    
    private func setupUI() {
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myImageView2)
        self.contentView.addSubview(awayScore)
        self.contentView.addSubview(awayAbv)
        self.contentView.addSubview(homeScore)
        self.contentView.addSubview(homeAbv)
        self.contentView.addSubview(finalOrInProgress)
        self.contentView.addSubview(dayAndWeek)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView2.translatesAutoresizingMaskIntoConstraints = false
        awayScore.translatesAutoresizingMaskIntoConstraints = false
        awayAbv.translatesAutoresizingMaskIntoConstraints = false
        homeScore.translatesAutoresizingMaskIntoConstraints = false
        homeAbv.translatesAutoresizingMaskIntoConstraints = false
        finalOrInProgress.translatesAutoresizingMaskIntoConstraints = false
        dayAndWeek.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            myImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            
            myImageView.widthAnchor.constraint(equalToConstant: 60),
            
            awayAbv.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 126),
            awayAbv.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            
            awayScore.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 130),
            awayScore.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            awayScore.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            homeAbv.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 222),
            homeAbv.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            
            homeScore.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 226),
            homeScore.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            homeScore.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            myImageView2.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            myImageView2.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            myImageView2.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 294),
            
            myImageView2.widthAnchor.constraint(equalToConstant: 60),
            
            finalOrInProgress.topAnchor.constraint(equalTo: self.myImageView.topAnchor, constant: 80),
            finalOrInProgress.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            
            dayAndWeek.topAnchor.constraint(equalTo: self.myImageView2.topAnchor, constant: 80),
            dayAndWeek.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 294),
        ])
    }
    
}
