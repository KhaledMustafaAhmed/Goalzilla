//
//  Team.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//

struct Team : Codable{
    var teamKey:String?
    var teamName: String?
    var teamLogo: String?
    var players: [Player]
}
