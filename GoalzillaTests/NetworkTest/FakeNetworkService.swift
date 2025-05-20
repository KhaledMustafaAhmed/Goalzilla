//
//  MockNetworkService.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 20/05/2025.
//

@testable import Goalzilla
import Foundation

// MARK: - Custom error for network:
enum NetworkError: Error, LocalizedError {
    case noData
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "Fail to get Data"
        }
    }
}
// MARK: - Mock Implementation for Network Service Layer represented by NetworkServiceProtocol
final class FakeNetworkService: NetworkServiceProtocol {
    
    var shouldReturnWithError  = false
    
    // MARK: - mock data for all sports league
    var mockLeagueResponseData: LeaguesResponse = LeaguesResponse(
        success: 1,
        result: [
        League(leagueKey: 1, leagueName: "Premier League", leagueLogo: "premier_league_logo.png", countryLogo: "england_flag.png", leagueCountry: "England", leagueCountryKey: 100),
        League(leagueKey: 2, leagueName: "La Liga", leagueLogo: "la_liga_logo.png", countryLogo: "spain_flag.png", leagueCountry: "Spain", leagueCountryKey: 101)
    ])
    // MARK: - mock data for tennis players
    var mockIndividual: TennisRankingResponse = TennisRankingResponse(
        success: 1,
        result: [
            TennisRanking(place: "1", player: "Novak Djokovic", playerKey: 101, league: "ATP", movement: "up", country: "Serbia", points: "12030"),
            TennisRanking(place: "2", player: "Carlos Alcaraz", playerKey: 102, league: "ATP", movement: "down", country: "Spain", points: "8120")
        ]
    )
    // MARK: - mock data for Basketball event:
    var mockBasketballEvents: BasketEventsResponse = BasketEventsResponse(
        success: 1,
        result: [
            BasketballEvent(
                eventKey: 1001,
                eventDate: "2025-05-20",
                eventTime: "18:30",
                homeTeam: "Lakers",
                awayTeam: "Warriors",
                homeTeamKey: 201,
                awayTeamKey: 202,
                eventFinalResult: "102-99",
                homeTeamLogo: "lakers_logo.png",
                awayTeamLogo: "warriors_logo.png",
                leagueKey: 301
            ),
            BasketballEvent(
                eventKey: 1002,
                eventDate: "2025-05-21",
                eventTime: "20:00",
                homeTeam: "Celtics",
                awayTeam: "Bulls",
                homeTeamKey: 203,
                awayTeamKey: 204,
                eventFinalResult: "95-88",
                homeTeamLogo: "celtics_logo.png",
                awayTeamLogo: "bulls_logo.png",
                leagueKey: 302
            )
        ]
    )
    // MARK: - mock data for Football event:
    var mockFootballEvents: FootballEventsResponse = FootballEventsResponse(
        success: 1,
        result: [
            FootballEvent(
                eventKey: 2001,
                eventDate: "2025-05-20",
                eventTime: "16:00",
                homeTeam: "Manchester United",
                awayTeam: "Chelsea",
                homeTeamKey: 301,
                awayTeamKey: 302,
                eventFinalResult: "2-1",
                homeTeamLogo: "manu_logo.png",
                awayTeamLogo: "chelsea_logo.png",
                leagueLogo: "premier_league_logo.png",
                leagueCountryLogo: "england_flag.png",
                leagueKey: 401
            ),
            FootballEvent(
                eventKey: 2002,
                eventDate: "2025-05-21",
                eventTime: "18:30",
                homeTeam: "Real Madrid",
                awayTeam: "Barcelona",
                homeTeamKey: 303,
                awayTeamKey: 304,
                eventFinalResult: "3-2",
                homeTeamLogo: "realmadrid_logo.png",
                awayTeamLogo: "barcelona_logo.png",
                leagueLogo: "laliga_logo.png",
                leagueCountryLogo: "spain_flag.png",
                leagueKey: 402
            )
        ]
    )
    // MARK: - mock data for Cricket event:
    var mockCricketEvents: CricketEventsResponse = CricketEventsResponse(
        success: 1,
        result: [
            CricketEvent(
                eventKey: 3001,
                eventDate: "2025-06-01",
                eventTime: "10:00",
                homeTeam: "India",
                awayTeam: "Australia",
                homeTeamKey: 401,
                awayTeamKey: 402,
                homeTeamLogo: "india_logo.png",
                awayTeamLogo: "australia_logo.png",
                leagueKey: 501,
                eventStatusInfo: "Scheduled",
                eventDateStop: "2025-06-05",
                eventHomeFinalResult: nil,
                eventAwayFinalResult: nil,
                countryName: "India",
                leagueName: "ICC World Test Championship",
                eventStadium: "Eden Gardens"
            ),
            CricketEvent(
                eventKey: 3002,
                eventDate: "2025-06-10",
                eventTime: "14:30",
                homeTeam: "England",
                awayTeam: "South Africa",
                homeTeamKey: 403,
                awayTeamKey: 404,
                homeTeamLogo: "england_logo.png",
                awayTeamLogo: "southafrica_logo.png",
                leagueKey: 502,
                eventStatusInfo: "In Progress",
                eventDateStop: "2025-06-14",
                eventHomeFinalResult: "250",
                eventAwayFinalResult: "240",
                countryName: "England",
                leagueName: "Test Series",
                eventStadium: "Lord's"
            )
        ]
    )
    // MARK: - mock data for Cricket event:
    var mockTennisEvents: TennisEventsResponse = TennisEventsResponse(
        success: 1,
        result: [
            TennisEvent(
                eventKey: 101,
                eventDate: "2025-07-10",
                eventTime: "14:00",
                homeTeam: "Roger Federer",
                awayTeam: "Rafael Nadal",
                homeTeamKey: 201,
                awayTeamKey: 202,
                eventFinalResult: "3-2",
                homeTeamLogo: "federer_logo.png",
                awayTeamLogo: "nadal_logo.png",
                eventWinner: "Roger Federer",
                leagueName: "Wimbledon",
                leagueKey: 301
            ),
            TennisEvent(
                eventKey: 102,
                eventDate: "2025-07-12",
                eventTime: "16:30",
                homeTeam: "Serena Williams",
                awayTeam: "Naomi Osaka",
                homeTeamKey: 203,
                awayTeamKey: 204,
                eventFinalResult: "2-3",
                homeTeamLogo: "serena_logo.png",
                awayTeamLogo: "osaka_logo.png",
                eventWinner: "Naomi Osaka",
                leagueName: "Wimbledon",
                leagueKey: 301
            )
        ]
    )
    // MARK: - mock data for basketball team
    var mockBasketballTeams: BasketballTeamsResponse = BasketballTeamsResponse(
        success: 1,
        result: [
            BasketballTeam(
                teamKey: 101,
                teamName: "Los Angeles Lakers",
                teamLogo: "lakers_logo.png"
            ),
            BasketballTeam(
                teamKey: 102,
                teamName: "Golden State Warriors",
                teamLogo: "warriors_logo.png"
            )
        ]
    )
    // MARK: - mock data for football team
    var mockFootballTeams: FootballTeamsResponse = FootballTeamsResponse(
        success: 1,
        result: [
            FootballTeam(
                teamKey: 201,
                teamName: "FC Barcelona",
                teamLogo: "barcelona_logo.png",
                players: [
                    Player(
                        playeKey: 1001,
                        playerName: "Lionel Messi",
                        playerNumber: "10",
                        playerCountry: "Argentina",
                        playerPosition: "Forward",
                        playerAge: "36",
                        playerImage: "messi.png"
                    ),
                    Player(
                        playeKey: 1002,
                        playerName: "Marc-André ter Stegen",
                        playerNumber: "1",
                        playerCountry: "Germany",
                        playerPosition: "Goalkeeper",
                        playerAge: "32",
                        playerImage: "ter_stegen.png"
                    )
                ]
            ),
            FootballTeam(
                teamKey: 202,
                teamName: "Manchester United",
                teamLogo: "manutd_logo.png",
                players: [
                    Player(
                        playeKey: 1003,
                        playerName: "Bruno Fernandes",
                        playerNumber: "8",
                        playerCountry: "Portugal",
                        playerPosition: "Midfielder",
                        playerAge: "29",
                        playerImage: "bruno.png"
                    ),
                    Player(
                        playeKey: 1004,
                        playerName: "Marcus Rashford",
                        playerNumber: "10",
                        playerCountry: "England",
                        playerPosition: "Forward",
                        playerAge: "27",
                        playerImage: "rashford.png"
                    )
                ]
            )
        ]
    )
    // MARK: - mock data for cricket team
    var mockCrackitTeams: CrackitTeamsResponse = CrackitTeamsResponse(
        success: 1,
        result: [
            CrackitTeam(
                teamKey: 301,
                teamName: "Code Ninjas",
                teamLogo: "code_ninjas_logo.png"
            ),
            CrackitTeam(
                teamKey: 302,
                teamName: "Bug Smashers",
                teamLogo: "bug_smashers_logo.png"
            )
        ]
    )

    


    func request<T>(sport: String, parameters: [String : Any], completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable, T : Encodable {
        
        if shouldReturnWithError {
            
            completion(.failure(NetworkError.noData))
            
        }else{
            
            if let response = mockLeagueResponseData as? T {
                
                completion(.success(response))
                
            } else if let response = mockIndividual as? T {
                
                completion(.success(response))
                
            } else if let response = mockBasketballEvents as? T {
                
                completion(.success(response))
                
            } else if let response = mockFootballEvents as? T {
                
                completion(.success(response))
                
            } else if let response = mockTennisEvents as? T {
                
                completion(.success(response))
                
            } else if let response = mockCricketEvents as? T {
                
                completion(.success(response))
                
            }else if let response = mockBasketballTeams as? T {
                
                completion(.success(response))
                
            }else if let response = mockFootballTeams as? T {
                
                completion(.success(response))
                
            }else if let response = mockCrackitTeams as? T{
                
                completion(.success(response))
                
            }
        }
    }
}


