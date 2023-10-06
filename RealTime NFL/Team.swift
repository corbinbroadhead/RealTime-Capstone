//
//  Team.swift
//  RealTime NFL
//
//  Created by Corbin Broadhead on 10/4/23.
//

import UIKit

class Team {
    var city = String()
    var name = String()
    var abv = String()
    var color = UIColor()
    var textColor = UIColor()
    
    init(city: String, name: String, abv: String, color: UIColor, textColor: UIColor) {
        self.city = city
        self.name = name
        self.abv = abv
        self.color = color
        self.textColor = textColor
    }
}
