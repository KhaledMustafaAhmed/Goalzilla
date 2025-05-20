//
//  CricketEventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

struct CricketEventsResponse: Codable, Equatable {
    let success: Int?
    let result: [CricketEvent]?
}

struct CricketEvent: Codable,  Equatable {
    var eventKey: Int?
    var eventDate: String?
    var eventTime: String?
    var homeTeam: String?
    var awayTeam: String?
    var homeTeamKey: Int?
    var awayTeamKey: Int?
    var homeTeamLogo: String?
    var awayTeamLogo: String?
    var leagueKey: Int?
    var eventStatusInfo: String?
    var eventDateStop: String?
    var eventHomeFinalResult: String?
    var eventAwayFinalResult: String?
    var countryName: String?
    var leagueName: String?
    var eventStadium: String?

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date_start"
        case eventTime = "event_time"
        case homeTeam = "event_home_team"
        case awayTeam = "event_away_team"
        case homeTeamKey = "home_team_key"
        case awayTeamKey = "away_team_key"
        case homeTeamLogo = "event_home_team_logo"
        case awayTeamLogo = "event_away_team_logo"
        case leagueKey = "league_key"
        case eventStatusInfo = "event_status_info"
        case eventDateStop = "event_date_stop"
        case eventHomeFinalResult = "event_home_final_result"
        case eventAwayFinalResult = "event_away_final_result"
        case countryName = "country_name"
        case leagueName = "league_name"
        case eventStadium = "event_stadium"
    }
}
