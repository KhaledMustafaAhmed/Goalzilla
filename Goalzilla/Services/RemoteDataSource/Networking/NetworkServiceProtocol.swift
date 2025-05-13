//
//  NetworkService.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

import Foundation

protocol NetworkServiceProtocol: LeaguesNetworkingProtocol, TeamsNetworkingProtocol, EventsNetworkingProtocol {
    func request<T: Codable>(
        sport: String,
        parameters: [String: Any],
        completion: @escaping (Result<T, Error>) -> Void
    )
}

protocol LeaguesNetworkingProtocol {
    func getLeagues(sport: String, completion: @escaping (Result<LeaguesResponse?, Error>) -> Void)
}

protocol TeamsNetworkingProtocol {
    func getFootballTeams(sport: String, leagueId: Int, completion: @escaping (Result<FootballTeamsResponse?, Error>) -> Void)
    func getBasketballTeams(sport: String, leagueId: Int, completion: @escaping (Result<BasketballTeamsResponse?, Error>) -> Void)
    func getCrackitTeams(sport: String, leagueId: Int, completion: @escaping (Result<CrackitTeamsResponse?, Error>) -> Void)
    func getTennisPlayersRanking(sport: String, leagueId: Int, completion: @escaping (Result<TennisRankingResponse?, Error>) -> Void)

}

protocol EventsNetworkingProtocol {
    func getFootballEvents(sport: String, leagueId: Int, completion: @escaping (Result<FootballEventsResponse?, Error>) -> Void)
    func getBasketballEvents(sport: String, leagueId: Int, completion: @escaping (Result<BasketEventsResponse?, Error>) -> Void)
    func getCrackitEvents(sport: String, leagueId: Int, completion: @escaping (Result<CricketEventsResponse?, Error>) -> Void)
    func getTennisEvents(sport: String, leagueId: Int, completion: @escaping (Result<TennisEventsResponse?, Error>) -> Void)
}

extension NetworkServiceProtocol {
    
    func getLeagues(sport: String, completion: @escaping (Result<LeaguesResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Leagues",
            "APIkey": Constants.apiKey
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getFootballTeams(sport: String, leagueId: Int, completion: @escaping (Result<FootballTeamsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Teams",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    
    func getBasketballTeams(sport: String, leagueId: Int, completion: @escaping (Result<BasketballTeamsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Teams",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getCrackitTeams(sport: String, leagueId: Int, completion: @escaping (Result<CrackitTeamsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Teams",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getFootballEvents(sport: String, leagueId: Int, completion: @escaping (Result<FootballEventsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Events",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getBasketballEvents(sport: String, leagueId: Int, completion: @escaping (Result<BasketEventsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Events",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getCrackitEvents(sport: String, leagueId: Int, completion: @escaping (Result<CricketEventsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Events",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getTennisEvents(sport: String, leagueId: Int, completion: @escaping (Result<TennisEventsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Events",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getTennisPlayersRanking(sport: String, leagueId: Int, completion: @escaping (Result<TennisRankingResponse?, Error>) -> Void){
        let parameters: [String: Any] = [
            "met": "Standings",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
}
