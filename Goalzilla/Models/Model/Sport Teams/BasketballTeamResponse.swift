//
//  BasketballTeamResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

struct BasketballTeamsResponse : Codable{
    var success:Int?
    var result:[BasketballTeam]?
}

struct BasketballTeam : Codable{
    var teamKey:Int?
    var teamName: String?
    var teamLogo: String?
    
    enum CodingKeys: String, CodingKey {
           case teamKey = "team_key"
           case teamName = "team_name"
           case teamLogo = "team_logo"
    }
}
