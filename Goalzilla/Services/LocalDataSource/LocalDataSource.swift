//
//  LocalDataSource.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol LocalDataSourceProtocol{
    func addLeagueInFavourite(team: League) -> Void
    func removeLeagueFromFavourite(league: League) -> Void
}

class LocalDataSource: LocalDataSourceProtocol {
    func addLeagueInFavourite(team: League) {
        
    }
    
    func removeLeagueFromFavourite(league: League) {
        
    }
    
  
}

        
