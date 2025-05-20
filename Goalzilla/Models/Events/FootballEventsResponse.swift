//
//  EventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//
import Foundation

struct FootballEventsResponse : Codable, Equatable{
    var success:Int?
    var result:[FootballEvent]?
}

struct FootballEvent: Codable, Equatable {
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
    var leagueLogo: String?
    var leagueCountryLogo: String?
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
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case leagueLogo = "league_logo"
        case leagueCountryLogo = "country_logo"
        case leagueKey = "league_key"
    }
}

