//
//  ProviderConfirmation.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//

class ProviderConfirmation : Provider{
    
    var remoteDataSource: any RemoteDataSourceProtocol
    var localDataSource: any LocalDataSourceProtocol
    
    init(remoteDataSource: any RemoteDataSourceProtocol, localDataSource: any LocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getLeagues(with sport: String, completion: @escaping (Result<LeaguesResponse?, any Error>) -> Void) {
        remoteDataSource.getLeagues(with: sport, completion: completion)
    }
    
    func getTeams(with sport: String, leagueId: Int, completion: @escaping (Result<TeamsResponse?, any Error>) -> Void) {
        remoteDataSource.getTeams(with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getEvents(with sport: String, leagueId: Int, completion: @escaping (Result<EventsResponse?, any Error>) -> Void) {
        remoteDataSource.getEvents(with: sport, leagueId: leagueId, completion: completion)
    }
    
    func addTeamInFavourite(team: Team) {
        
    }
    
    func removeTeamFromFavourite(team: Team) {
        
    }

}
