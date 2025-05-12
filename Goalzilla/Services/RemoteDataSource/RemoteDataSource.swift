//
//  RemoteDataSource.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

protocol RemoteDataSourceProtocol{
    
    func getLeagues(with sport: String, completion: @escaping (Result<LeaguesResponse?, Error>) -> Void)
    
    func getTeams(with sport: String, leagueId: Int, completion: @escaping (Result<TeamsResponse?, Error>) -> Void)
    
    func getEvents(with sport: String, leagueId: Int, completion: @escaping (Result<EventsResponse?, Error>) -> Void)
}


class RemoteDataSource: RemoteDataSourceProtocol{
    
    let networkService: NetworkServiceProtocol!
    
    init(networkService: NetworkServiceProtocol){
        self.networkService = networkService
    }

    func getLeagues(with sport: String, completion: @escaping (Result<LeaguesResponse?, any Error>) -> Void) {
        networkService.getLeagues(sport: sport, completion: completion)
    }
    
    func getTeams(with sport: String, leagueId: Int, completion: @escaping (Result<TeamsResponse?, any Error>) -> Void) {
        networkService.getTeams(sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getEvents(with sport: String, leagueId: Int, completion: @escaping (Result<EventsResponse?, any Error>) -> Void) {
        networkService.getEvents(sport: sport, leagueId: leagueId, completion: completion)
    }
}
