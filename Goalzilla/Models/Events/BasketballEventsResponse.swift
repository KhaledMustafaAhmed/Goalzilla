//
//  BasketballEventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

import Foundation

struct BasketEventsResponse : Codable, Equatable{
    var success:Int?
    var result:[BasketballEvent]?
}

struct BasketballEvent: Codable, Equatable {
    var eventKey: Int?
    var eventDate: String?
    var eventTime: String?
    var homeTeam: String?
    var awayTeam: String?
    var homeTeamKey: Int?
    var awayTeamKey: Int?
    var eventFinalResult: String?
    var homeTeamLogo: String?
    var awayTeamLogo: String?
    var leagueKey: Int?

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case homeTeam = "event_home_team"
        case awayTeam = "event_away_team"
        case homeTeamKey = "home_team_key"
        case awayTeamKey = "away_team_key"
        case eventFinalResult = "event_final_result"
        case homeTeamLogo = "event_home_team_logo"
        case awayTeamLogo = "event_away_team_logo"
        case leagueKey = "league_key"
    }
}
