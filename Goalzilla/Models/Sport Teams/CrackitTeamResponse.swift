//
//  CrackitTeamResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

struct CrackitTeamsResponse : Codable{
    var success:Int?
    var result:[CrackitTeam]?
}

struct CrackitTeam : Codable{
    var teamKey:Int?
    var teamName: String?
    var teamLogo: String?
    
    enum CodingKeys: String, CodingKey {
           case teamKey = "team_key"
           case teamName = "team_name"
           case teamLogo = "team_logo"
    }
}
