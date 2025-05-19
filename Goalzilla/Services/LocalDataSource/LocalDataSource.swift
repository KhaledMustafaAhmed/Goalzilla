//
//  LocalDataSource.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

/// A local data source responsible for managing favourite leagues stored locally.
///
/// This class relies on a `FavouritesModelManagerProtocol` implementation to perform
/// CRUD operations on `FavouritesModel` entities in the local persistent store.
/// It acts as a bridge between higher-level data access layers and the Core Data manager.
///
/// The main responsibilities include fetching all favourites, adding a league to favourites,
/// and removing a league from favourites.
class LocalDataSource: LocalDataSourceProtocol {
    
    /// The favourite leagues manager that handles the Core Data operations.
    private let favouriteModelManager: FavouritesModelManagerProtocol

    /// Initializes the local data source with the provided favourites manager.
    ///
    /// - Parameter favouriteModelManager: An instance conforming to `FavouritesModelManagerProtocol`
    ///   used to perform local persistence operations.
    init(favouriteModelManager: FavouritesModelManagerProtocol) {
        self.favouriteModelManager = favouriteModelManager
    }

    /// Retrieves all favourite leagues stored locally.
    ///
    /// - Returns: An optional array of `FavouritesModel` representing all stored favourite leagues.
    func getAllFavourites() -> [FavouritesModel]? {
        favouriteModelManager.fetchAll()
    }

    /// Adds a league to the favourites list in local storage.
    ///
    /// - Parameter league: The `FavouritesModel` instance representing the league to be added.
    func addLeagueToFavourites(_ league: FavouritesModel) {
        favouriteModelManager.add(league)
    }

    /// Removes a league from the favourites list in local storage.
    ///
    /// - Parameter league: The `FavouritesModel` instance representing the league to be removed.
    /// - Returns: A Boolean indicating whether the deletion was successful (`true`) or not (`false`).
    func removeLeagueFromFavourites(_ league: FavouritesModel) -> Bool {
        favouriteModelManager.delete(league)
    }
}
