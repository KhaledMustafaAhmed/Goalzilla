//
//  Player.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//

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
