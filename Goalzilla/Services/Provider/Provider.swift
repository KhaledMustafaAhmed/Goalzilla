//
//  Provider.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol Provider{
    
    var remoteDataSource: RemoteDataSourceProtocol {get}
    
    var localDataSource: LocalDataSourceProtocol {get}
    
    func getLeagues(with sport: String, completion: @escaping (Result<LeaguesResponse?, Error>) -> Void)
    
    func getTeams(with sport: String, leagueId: Int, completion: @escaping (Result<TeamsResponse?, Error>) -> Void)
    
    func getEvents(with sport: String, leagueId: Int, completion: @escaping (Result<EventsResponse?, Error>) -> Void)
    
    // local
    func addTeamInFavourite(team: Team) -> Void
    func removeTeamFromFavourite(team: Team) -> Void
}

