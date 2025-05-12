//
//  Team.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//

struct Team : Codable{
    
    init(teamKey: Int? = nil, teamName: String? = nil, teamLogo: String? = nil, players: [Player]) {
        self.teamKey = teamKey
        self.teamName = teamName
        self.teamLogo = teamLogo
        self.players = players
    }
  
    var teamKey:Int?
    var teamName: String?
    var teamLogo: String?
    var players: [Player]
    
    enum CodingKeys: String, CodingKey {
           case teamKey = "team_key"
           case teamName = "team_name"
           case teamLogo = "team_logo"
           case players = "players"
    }
    
}
