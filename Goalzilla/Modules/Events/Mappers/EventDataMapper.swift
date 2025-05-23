//
//  EventDataMapper.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 18/05/2025.
//

struct EventDataMapper{
    let leagueKey: String?
    let eventDate: String?
    let eventTime: String?
    let eventHomeTeam: String?
    let eventAwayTeam: String?
    let eventHomeTeamLogo: String?
    let eventAwayTeamLogo: String?
    let eventFinalResult: String?
    let eventAwayFinalResultForCricket: String?
    
    private init(leagueKey: String?, eventDate: String?, eventTime: String?, eventHomeTeam: String?, eventAwayTeam: String?, eventHomeTeamLogo: String?, eventAwayTeamLogo: String?, eventFinalResult: String?, eventAwayFinalResultForCricket: String?) {
        self.leagueKey = leagueKey
        self.eventDate = eventDate
        self.eventTime = eventTime
        self.eventHomeTeam = eventHomeTeam
        self.eventAwayTeam = eventAwayTeam
        self.eventHomeTeamLogo = eventHomeTeamLogo
        self.eventAwayTeamLogo = eventAwayTeamLogo
        self.eventFinalResult = eventFinalResult
        self.eventAwayFinalResultForCricket = nil
    }
    
    private init(){
        self.init(leagueKey: "no-data", eventDate: "no-data", eventTime: "no-data", eventHomeTeam: "no-data", eventAwayTeam: "no-data", eventHomeTeamLogo: "no-data", eventAwayTeamLogo: "no-data", eventFinalResult: "no-data", eventAwayFinalResultForCricket: "no-data")
    }
}

extension EventDataMapper{
    static func createEvent<T: Codable>(from sportEvent : T) -> EventDataMapper{
        switch sportEvent{
        case let footballEvent as FootballEvent:
             return EventDataMapper(
                leagueKey: footballEvent.leagueKey.map { String($0) },
                eventDate: footballEvent.eventDate,
                eventTime: footballEvent.eventTime,
                eventHomeTeam: footballEvent.homeTeam,
                eventAwayTeam: footballEvent.awayTeam,
                eventHomeTeamLogo: footballEvent.homeTeamLogo,
                eventAwayTeamLogo: footballEvent.awayTeamLogo,
                eventFinalResult: footballEvent.eventFinalResult,
                eventAwayFinalResultForCricket: nil
            )
            case let basketballEvent as BasketballEvent:
            return EventDataMapper(
                            leagueKey: basketballEvent.leagueKey.map { String($0) },
                            eventDate: basketballEvent.eventDate,
                            eventTime: basketballEvent.eventTime,
                            eventHomeTeam: basketballEvent.homeTeam,
                            eventAwayTeam: basketballEvent.awayTeam,
                            eventHomeTeamLogo: basketballEvent.homeTeamLogo,
                            eventAwayTeamLogo: basketballEvent.awayTeamLogo,
                            eventFinalResult: basketballEvent.eventFinalResult,
                            eventAwayFinalResultForCricket: nil
                        )
        case let cricketEvent as CricketEvent:
                    return EventDataMapper(
                        leagueKey: cricketEvent.leagueKey.map { String($0) },
                        eventDate: cricketEvent.eventDate,
                        eventTime: cricketEvent.eventTime,
                        eventHomeTeam: cricketEvent.homeTeam,
                        eventAwayTeam: cricketEvent.awayTeam,
                        eventHomeTeamLogo: cricketEvent.homeTeamLogo,
                        eventAwayTeamLogo: cricketEvent.awayTeamLogo,
                        eventFinalResult: cricketEvent.eventHomeFinalResult,
                        eventAwayFinalResultForCricket: cricketEvent.eventAwayFinalResult
                    )

                case let tennis as TennisEvent:
                    return EventDataMapper(
                        leagueKey: tennis.leagueKey.map { String($0) },
                        eventDate: tennis.eventDate,
                        eventTime: tennis.eventTime,
                        eventHomeTeam: tennis.homeTeam,
                        eventAwayTeam: tennis.awayTeam,
                        eventHomeTeamLogo: tennis.homeTeamLogo,
                        eventAwayTeamLogo: tennis.awayTeamLogo,
                        eventFinalResult: tennis.eventFinalResult,
                        eventAwayFinalResultForCricket: nil
                    )
        default:
            return EventDataMapper()
        }
    }
}

/*
 league_key

 event_date
 event_time

 event_home_team
 event_away_team

 event_home_team_logo
 event_away_team_logo

 event_final_result
 */
