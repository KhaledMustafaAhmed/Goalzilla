//
//  Provider.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

class Repository{
    let remote = RemoteDataSource()
    func getLeagues(sport: String, completion: @escaping (Result<LeagueResponse?, Error>) -> Void){
        remote.getLeagues(sport: sport, completion: completion)
    }
}
