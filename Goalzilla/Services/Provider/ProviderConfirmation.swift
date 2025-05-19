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
    
    func getFootballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<FootballTeamsResponse?, any Error>) -> Void) {
        remoteDataSource.getFootballTeams(with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getBasketballTeams(with sport: String, leagueId: Int, completion: @escaping (Result<BasketballTeamsResponse?, any Error>) -> Void) {
        remoteDataSource.getBasketballTeams(with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getCrackitTeams(with sport: String, leagueId: Int, completion: @escaping (Result<CrackitTeamsResponse?, any Error>) -> Void) {
        remoteDataSource.getCrackitTeams(with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getTennisPlayersRanking(with sport: String, leagueId: Int, completion: @escaping (Result<TennisRankingResponse?, any Error>) -> Void) {
        remoteDataSource.getTennisPlayersRanking(with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getFootballEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<FootballEventsResponse?, any Error>) -> Void) {
        remoteDataSource.getFootballEvents(with: type ,with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getBasketballEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<BasketEventsResponse?, any Error>) -> Void) {
        remoteDataSource.getBasketballEvents(with: type, with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getCrackitEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<CricketEventsResponse?, any Error>) -> Void) {
        remoteDataSource.getCrackitEvents(with: type, with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getTennisEvents(with type: EventSectionType, with sport: String, leagueId: Int, completion: @escaping (Result<TennisEventsResponse?, any Error>) -> Void) {
        remoteDataSource.getTennisEvents(with: type, with: sport, leagueId: leagueId, completion: completion)
    }
    
    func getAllFavourites() -> [FavouritesModel]? {
        localDataSource.getAllFavourites()
    }
    
    func addLeagueToFavourites(_ league: FavouritesModel) {
        localDataSource.addLeagueToFavourites(league)
    }
    
    func removeLeagueFromFavourites(_ league: FavouritesModel) -> Bool {
        localDataSource.removeLeagueFromFavourites(league)
    }
}
