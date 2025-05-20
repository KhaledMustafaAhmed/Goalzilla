//
//  TennisEventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

import Foundation

struct TennisEventsResponse: Codable, Equatable {
    let success: Int?
    let result: [TennisEvent]?
}

struct TennisEvent: Codable, Equatable{
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
    var eventWinner: String?
    var leagueName: String?
    var leagueKey: Int?

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case homeTeam = "event_first_player"
        case awayTeam = "event_second_player"
        case homeTeamKey = "first_player_key"
        case awayTeamKey = "second_player_key"
        case eventFinalResult = "event_final_result"
        case homeTeamLogo = "event_first_player_logo"
        case awayTeamLogo = "event_second_player_logo"
        case eventWinner = "event_winner"
        case leagueName = "league_name"
        case leagueKey = "league_key"
    }
}
