//
//  LeagueTennisPlayerResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

struct TennisRankingResponse: Codable {
    let success: Int?
    let result: [TennisRanking]?
}

struct TennisRanking: Codable {
    let place: String?
    let player: String?
    let playerKey: Int?
    let league: String?
    let movement: String?
    let country: String?
    let points: String?
    
    enum CodingKeys: String, CodingKey {
        case place
        case player
        case playerKey = "player_key"
        case league
        case movement
        case country
        case points
    }
}
