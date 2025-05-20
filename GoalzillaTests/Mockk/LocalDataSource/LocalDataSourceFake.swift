//
//  LocalDataSourceFake.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

@testable import Goalzilla

class LocalDataSourceFake : LocalDataSourceProtocol{
    
    private let favouriteModelManager: FavouritesModelManagerProtocol
    
    init(favouriteModelManager: FavouritesModelManagerProtocol) {
        self.favouriteModelManager = favouriteModelManager
    }
    
    func getAllFavourites() -> [Goalzilla.FavouritesModel]? {
        return favouriteModelManager.fetchAll()
    }
    
    func addLeagueToFavourites(_ league: Goalzilla.FavouritesModel) {
        favouriteModelManager.add(league)
    }
    
    func removeLeagueFromFavourites(_ league: Goalzilla.FavouritesModel) -> Bool {
        favouriteModelManager.delete(league)
    }
    
    func checkifLeagueAtFavourite(leagueId: Int) -> Bool {
        favouriteModelManager.search(leagueId: leagueId)
    }
}
