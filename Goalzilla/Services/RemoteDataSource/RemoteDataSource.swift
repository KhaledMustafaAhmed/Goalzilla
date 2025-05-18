//
//  RemoteDataSource.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
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


class RemoteDataSource: RemoteDataSourceProtocol{
    
    let networkService: NetworkServiceProtocol!
     
     init(networkService: NetworkServiceProtocol){
         self.networkService = networkService
     }
    
    func getLeagues(with sport: String, completion: @escaping (Result<LeaguesResponse?, any Error>) -> Void) {
        networkService.getLeagues(sport: sport, completion: completion)
    }
    
    func getFootballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<FootballTeamsResponse?, any Error>) -> Void) {
        networkService.getFootballTeams(sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getBasketballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<BasketballTeamsResponse?, any Error>) -> Void) {
        networkService.getBasketballTeams(sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getCrackitTeams(with sport: String, leagueId: Int, completion: @escaping (Result<CrackitTeamsResponse?, any Error>) -> Void) {
        networkService.getCrackitTeams(sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getTennisPlayersRanking(with sport: String, leagueId: Int, completion: @escaping (Result<TennisRankingResponse?, any Error>) -> Void) {
        networkService.getTennisPlayersRanking(sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getFootballEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<FootballEventsResponse?, any Error>) -> Void) {
        networkService.getFootballEvents(with: type, sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getBasketballEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<BasketEventsResponse?, any Error>) -> Void) {
        networkService.getBasketballEvents(with: type,sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getCrackitEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<CricketEventsResponse?, any Error>) -> Void) {
        networkService.getCrackitEvents(with: type,sport: sport, leagueId: leagueId, completion: completion)
    }
    
    func getTennisEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<TennisEventsResponse?, any Error>) -> Void) {
        networkService.getTennisEvents(with: type,sport: sport, leagueId: leagueId, completion: completion)
    }
    
}
