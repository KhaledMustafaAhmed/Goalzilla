//
//  FavouritesModelManager.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 19/05/2025.
//

import CoreData


/// Protocol defining the CRUD interface for managing `FavouritesModel` entities.
protocol FavouritesModelManagerProtocol {
    
    /// Adds a new favourite league.
    ///
    /// - Parameter favourite: The `FavouritesModel` instance to be added to the favourites list.
    func add(_ favourite: FavouritesModel)
    
    /// Fetches all saved favourite leagues.
    ///
    /// - Returns: An optional array of `FavouritesModel` instances if data exists, otherwise `nil`.
    func fetchAll() -> [FavouritesModel]?
    
    /// Deletes a specified favourite league.
    ///
    /// - Parameter favourite: The `FavouritesModel` instance to be removed from the favourites list.
    /// - Returns: A Boolean indicating whether the deletion was successful (`true`) or not (`false`).
    func delete(_ favourite: FavouritesModel) -> Bool
}

/// Concrete implementation of `FavouritesModelManagerProtocol` responsible for
/// managing favourite leagues using Core Data.
///
/// This class acts as an intermediary between the application and Core Data,
/// converting `FavouritesModel` instances to Core Data entities and vice versa,
/// and performing create, read, and delete operations.
final class FavouritesModelManager: FavouritesModelManagerProtocol {
    
    /// Adds a new league to the favourites by creating a corresponding Core Data entity
    /// and saving the context.
    ///
    /// - Parameter favourite: The favourite league to add.
    func add(_ favourite: FavouritesModel) {
        let context = CoreDataService.shared.context
        let cdFavLeague = CDFavLeague(context: context)
        cdFavLeague.leagueID = Int64(favourite.leagueId)
        cdFavLeague.leagueName = favourite.leagueName
        cdFavLeague.leagueLogo = favourite.leagueLogo
        CoreDataService.shared.saveContext()
    }
    
    /// Fetches all favourite leagues from Core Data, converts them into `FavouritesModel`
    /// instances, and returns them.
    ///
    /// - Returns: An optional array of `FavouritesModel`. Returns `nil` if fetching fails or no data is found.
    func fetchAll() -> [FavouritesModel]? {
        do {
            let result = try CoreDataService.shared.context.fetch(CDFavLeague.fetchRequest()) as [CDFavLeague]
            return result.map { $0.convertCDFavLeagueToFavLeague() }
        } catch {
            print("Failed to fetch favourite leagues: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// Deletes a favourite league from Core Data by locating the corresponding entity
    /// using the league's identifier and removing it from the context.
    ///
    /// - Parameter favourite: The favourite league to delete.
    /// - Returns: `true` if deletion and saving succeeded, otherwise `false`.
    func delete(_ favourite: FavouritesModel) -> Bool {
        guard let obj = getObjById(with: Int64(favourite.leagueId)) else {
            print("Delete failed: object with ID \(favourite.leagueId) not found")
            return false
        }
        
        CoreDataService.shared.context.delete(obj)
        
        do {
            try CoreDataService.shared.context.save()
            return true
        } catch {
            print("Error saving context after deletion: \(error.localizedDescription)")
            return false
        }
    }
    
    /// Retrieves the Core Data managed object for a given league ID.
    ///
    /// - Parameter id: The league ID to search for.
    /// - Returns: An optional `NSManagedObject` if found, otherwise `nil`.
    private func getObjById(with id: Int64) -> NSManagedObject? {
        let fetchRequest = NSFetchRequest<CDFavLeague>(entityName: "CDFavLeague")
        fetchRequest.predicate = NSPredicate(format: "leagueID == %ld", id)
        
        do {
            return try CoreDataService.shared.context.fetch(fetchRequest).first
        } catch {
            print("Error fetching object by ID \(id): \(error.localizedDescription)")
            return nil
        }
    }
}

