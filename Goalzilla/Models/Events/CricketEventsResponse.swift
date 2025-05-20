//
//  CricketEventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

struct CricketEventsResponse: Codable {
    let success: Int?
    let result: [CricketEvent]?
}

struct CricketEvent: Codable {
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


//
//struct CricketEvent: Codable {
//    let eventKey: Int?
//    let eventDateStart, eventDateStop: String?
//    let eventTime: String?
//    let eventHomeTeam: String?
//    let homeTeamKey: Int?
//    let eventAwayTeam: String?
//    let awayTeamKey: Int?
//    let eventHomeFinalResult, eventAwayFinalResult: String?
//    let eventStatusInfo: String?
//    let countryName, leagueName: String?
//    let leagueKey: Int?
//    let eventStadium: String?
//    let eventHomeTeamLogo: String?
//    let eventAwayTeamLogo: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case eventKey = "event_key"
//        case eventDateStart = "event_date_start"
//        case eventDateStop = "event_date_stop"
//        case eventTime = "event_time"
//        case eventHomeTeam = "event_home_team"
//        case homeTeamKey = "home_team_key"
//        case eventAwayTeam = "event_away_team"
//        case awayTeamKey = "away_team_key"
//        case eventHomeFinalResult = "event_home_final_result"
//        case eventAwayFinalResult = "event_away_final_result"
//        case eventStatusInfo = "event_status_info"
//        case countryName = "country_name"
//        case leagueName = "league_name"
//        case leagueKey = "league_key"
//        case eventStadium = "event_stadium"
//        case eventHomeTeamLogo = "event_home_team_logo"
//        case eventAwayTeamLogo = "event_away_team_logo"
//    }
//}
