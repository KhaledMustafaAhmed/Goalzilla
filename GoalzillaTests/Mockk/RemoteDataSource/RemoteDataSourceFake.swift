//
//  RemoteDataSourceFake.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

@testable import Goalzilla
class RemoteDataSourceFake: RemoteDataSourceProtocol{
    
    let networkService: NetworkServiceProtocol!
     
     init(networkService: NetworkServiceProtocol){
         self.networkService = networkService
     }
    
    func getLeagues(with sport: String, completion: @escaping (Result<Goalzilla.LeaguesResponse?, any Error>) -> Void) {
        
    }
    
    func getFootballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.FootballTeamsResponse?, any Error>) -> Void) {
        
    }
    
    func getBasketballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.BasketballTeamsResponse?, any Error>) -> Void) {
        
    }
    
    func getCrackitTeams(with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.CrackitTeamsResponse?, any Error>) -> Void) {
        
    }
    
    func getTennisPlayersRanking(with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.TennisRankingResponse?, any Error>) -> Void) {
        
    }
    
    func getFootballEvents(with type: Goalzilla.EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.FootballEventsResponse?, any Error>) -> Void) {
        
    }
    
    func getBasketballEvents(with type: Goalzilla.EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.BasketEventsResponse?, any Error>) -> Void) {
        
    }
    
    func getCrackitEvents(with type: Goalzilla.EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.CricketEventsResponse?, any Error>) -> Void) {
        
    }
    
    func getTennisEvents(with type: Goalzilla.EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<Goalzilla.TennisEventsResponse?, any Error>) -> Void) {
        
    }
    
    
}
