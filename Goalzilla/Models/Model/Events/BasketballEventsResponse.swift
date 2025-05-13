//
//  BasketballEventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 12/5/25.
//

import Foundation

struct BasketEventsResponse : Codable{
    var success:Int?
    var result:[BasketballEvent]?
}

struct BasketballEvent:Codable{
    var eventKey:Int?
    var eventDate:String?
    var eventTime:String?
    var homeTeam:String?
    var secondTeam:String?
    var homeTeamKey:Int?
    var secondTeamKey:Int?
    var eventFinalResult:String?
    var homeTeamLogo:String?
    var secondTeamLogo:String?
    
    enum CodingKeys: String, CodingKey {
           case eventKey = "event_key"
           case eventDate = "event_date"
           case eventTime = "event_time"
           case homeTeam = "event_home_team"
           case secondTeam = "event_away_team"
           case homeTeamKey = "home_team_key"
           case secondTeamKey = "away_team_key"
           case eventFinalResult = "event_final_result"
           case homeTeamLogo = "event_home_team_logo"
           case secondTeamLogo = "event_away_team_logo"
       }
}

