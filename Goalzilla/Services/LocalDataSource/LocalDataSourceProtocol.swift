//
//  LocalDataSourceProtocol.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 19/05/2025.
//

/// A protocol that defines methods for managing a list of favourite leagues in local storage.
protocol LocalDataSourceProtocol{
    /// Retrieves all the favourite leagues stored locally.
    ///
    /// Each favourite league is represented by a `FavouritesModel` object containing its ID, name, and logo URL.
    ///
    /// - Returns: An array of `FavouritesModel` representing all saved favourite leagues.
    func getAllFavourites() -> [FavouritesModel]?

    /// Adds a specific league to the local list of favourites.
    ///
    /// - Parameter league: A `FavouritesModel` instance containing:
    ///   - `leagueId`: The unique identifier of the league.
    ///   - `leagueName`: The name of the league.
    ///   - `leagueLogo`: A URL string pointing to the league's logo image.
    func addLeagueToFavourites(_ league: FavouritesModel)

    /// Removes a specific league from the local list of favourites.
    ///
    /// - Parameter league: A `FavouritesModel` instance matching the league to be removed,
    ///   typically identified by its `leagueId`.
    func removeLeagueFromFavourites(_ league: FavouritesModel) -> Bool
    
    func checkifLeagueAtFavourite(leagueId:Int)->Bool
}
