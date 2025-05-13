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
    
    // Football Teams Including Team Player information
    func getFootballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<FootballTeamsResponse?, Error>) -> Void)
    
    func getBasketballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<BasketballTeamsResponse?, Error>) -> Void)
    func getCrackitTeams(with sport: String, leagueId: Int, completion: @escaping (Result<CrackitTeamsResponse?, Error>) -> Void)
    
    func getFootballEvents(with sport: String, leagueId: Int, completion: @escaping (Result<FootballEventsResponse?, Error>) -> Void)
    func getBasketballEvents(with sport: String, leagueId: Int, completion: @escaping (Result<BasketEventsResponse?, Error>) -> Void)
    func getCrackitEvents(with sport: String, leagueId: Int, completion: @escaping (Result<CricketEventsResponse?, Error>) -> Void)
    func getTennisEvents(with sport: String, leagueId: Int, completion: @escaping (Result<TennisEventsResponse?, Error>) -> Void)
    
    
    func getTennisPlayersRanking(with sport: String , leagueId:Int , completion: @escaping (Result<TennisRankingResponse? , Error>) -> Void)
    
    
    
    
    
    
    // Local Data Source Methods
    func addLeagueInFavourite(league: League) -> Void
    func removeLeagueFromFavourite(league: League) -> Void
}

