//
//  FavourtieModelManagerFake.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

@testable import Goalzilla

class FavourtieModelManagerFake:FavouritesModelManagerProtocol{
    
    private var favourties:[FavouritesModel] = []
    
    func add(_ favourite: Goalzilla.FavouritesModel) {
        favourties.append(favourite)
    }
    
    func fetchAll() -> [Goalzilla.FavouritesModel]? {
        return favourties
    }
    
    func delete(_ favourite: Goalzilla.FavouritesModel) -> Bool {
        if let index = favourties.firstIndex(where: {$0.leagueId == favourite.leagueId}){
            favourties.remove(at: index)
            return true
        }
        return false
        
    }
    
    func search(leagueId: Int) -> Bool {
        return favourties.contains(where: {$0.leagueId == leagueId})
    }
    
    
}
