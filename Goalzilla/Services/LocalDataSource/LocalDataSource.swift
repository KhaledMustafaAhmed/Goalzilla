//
//  LocalDataSource.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol LocalDataSourceProtocol{
    func addTeamInFavourite(team: Team) -> Void
    func removeTeamFromFavourite(team: Team) -> Void
}

class LocalDataSource: LocalDataSourceProtocol {
    func addTeamInFavourite(team: Team) {
        
    }
        func removeTeamFromFavourite(team: Team) {
        }
    
}

        
