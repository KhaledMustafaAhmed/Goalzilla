//
//  CDFavLeague+CoreDataProperties.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 20/05/2025.
//
//

import Foundation
import CoreData


extension CDFavLeague {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFavLeague> {
        return NSFetchRequest<CDFavLeague>(entityName: "CDFavLeague")
    }

    @NSManaged public var leagueID: Int64
    @NSManaged public var leagueLogo: String?
    @NSManaged public var leagueName: String?
    @NSManaged public var sportName: String?

}

extension CDFavLeague : Identifiable {
    func convertCDFavLeagueToFavLeague() -> FavouritesModel {
        return FavouritesModel(leagueId: Int(self.leagueID), leagueName: self.leagueName ?? "no-data-returned", leagueLogo: self.leagueLogo ?? "no-data-returned", sportName: self.sportName ?? "no-sport-name")
    }
}
