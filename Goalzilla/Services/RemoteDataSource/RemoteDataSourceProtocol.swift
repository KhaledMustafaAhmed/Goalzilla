//
//  RemoteDataSourceProtocol.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 19/05/2025.
//

protocol RemoteDataSourceProtocol{
    
    func getLeagues(with sport: String, completion: @escaping (Result<LeaguesResponse?, Error>) -> Void)
    
    func getFootballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<FootballTeamsResponse?, Error>) -> Void)
    
    func getBasketballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<BasketballTeamsResponse?, Error>) -> Void)
    
    func getCrackitTeams(with sport: String, leagueId: Int, completion: @escaping (Result<CrackitTeamsResponse?, Error>) -> Void)
    
    func getTennisPlayersRanking(with sport: String, leagueId: Int, completion: @escaping (Result<TennisRankingResponse?, Error>) -> Void)
    
    func getFootballEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<FootballEventsResponse?, Error>) -> Void)
    
    func getBasketballEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<BasketEventsResponse?, Error>) -> Void)
    
    func getCrackitEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<CricketEventsResponse?, Error>) -> Void)
    
    func getTennisEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<TennisEventsResponse?, Error>) -> Void)
}
