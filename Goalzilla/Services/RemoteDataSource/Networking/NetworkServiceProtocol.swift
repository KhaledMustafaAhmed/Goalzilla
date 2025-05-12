//
//  NetworkService.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//


struct EventResponse: Codable{}

import Foundation

protocol NetworkServiceProtocol: LeaguesNetworkingProtocol, TeamsNetworkingProtocol, EventsNetworkingProtocol {
    func request<T: Decodable>(
        sport: String,
        parameters: [String: Any],
        completion: @escaping (Result<T, Error>) -> Void
    )
}

protocol LeaguesNetworkingProtocol {
    func getLeagues(sport: String, completion: @escaping (Result<LeagueResponse?, Error>) -> Void)
}

protocol TeamsNetworkingProtocol {
    func getTeams(sport: String, leagueId: Int, completion: @escaping (Result<TeamResponse?, Error>) -> Void)
    func getTeamDetails(sport: String, teamId: Int, completion: @escaping (Result<TeamDetailsResponse?, Error>) -> Void)
}

protocol EventsNetworkingProtocol {
    func getEvents(sport: String, leagueId: Int, completion: @escaping (Result<EventResponse?, Error>) -> Void)
}

extension NetworkServiceProtocol {
    func getLeagues(sport: String, completion: @escaping (Result<LeagueResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Leagues",
            "APIkey": Constants.apiKey
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getTeams(sport: String, leagueId: Int, completion: @escaping (Result<TeamResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Teams",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getTeamDetails(sport: String, teamId: Int, completion: @escaping (Result<TeamDetailsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Teams",
            "APIkey": Constants.apiKey,
            "teamId": teamId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getEvents(sport: String, leagueId: Int, completion: @escaping (Result<EventResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Events",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
}
