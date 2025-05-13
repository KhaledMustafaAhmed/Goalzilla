//
//  LocalDataSource.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol LocalDataSourceProtocol{
    func addLeagueInFavourite(league: League) -> Void
    func removeLeagueFromFavourite(league: League) -> Void
}

class LocalDataSource: LocalDataSourceProtocol {
    func addLeagueInFavourite(league: League) {
        
    }
    
    func removeLeagueFromFavourite(league: League) {
        
    }
    
  
}

        
