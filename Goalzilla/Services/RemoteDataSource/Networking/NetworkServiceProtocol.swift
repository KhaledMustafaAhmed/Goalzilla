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
    func getTeams(sport: String, leagueId: Int, completion: @escaping (Result<TeamsResponse?, Error>) -> Void)
}

protocol EventsNetworkingProtocol {
    func getEvents(sport: String, leagueId: Int, completion: @escaping (Result<EventsResponse?, Error>) -> Void)
}

extension NetworkServiceProtocol {
    func getLeagues(sport: String, completion: @escaping (Result<LeaguesResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Leagues",
            "APIkey": Constants.apiKey
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getTeams(sport: String, leagueId: Int, completion: @escaping (Result<TeamsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Teams",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
    
    func getEvents(sport: String, leagueId: Int, completion: @escaping (Result<EventsResponse?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "met": "Events",
            "APIkey": Constants.apiKey,
            "leagueId": leagueId
        ]
        request(sport: sport, parameters: parameters, completion: completion)
    }
}
