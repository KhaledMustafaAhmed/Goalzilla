//
//  FootballTeamResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//
struct FootballTeamsResponse : Codable{
    var success:Int?
    var result:[FootballTeam]?
}

struct FootballTeam : Codable{
    var teamKey:Int?
    var teamName: String?
    var teamLogo: String?
    var players: [Player]?
    
    enum CodingKeys: String, CodingKey {
           case teamKey = "team_key"
           case teamName = "team_name"
           case teamLogo = "team_logo"
           case players = "players"
    }
}

struct Player : Codable{
    var playeKey: Int?
    var playerName:String?
    var playerNumber: String?
    var playerCountry:String?
    var playerPosition:String?
    var playerAge: String?
    var playerImage: String?
    
    
    enum CodingKeys: String, CodingKey {
        case playeKey = "player_key"
        case playerName = "player_name"
        case playerNumber = "player_number"
        case playerCountry = "player_country"
        case playerPosition = "player_type"
        case playerAge = "player_age"
        case playerImage = "player_image"
    }
    
}
