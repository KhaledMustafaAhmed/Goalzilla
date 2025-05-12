//
//  RemoteDataSource.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

class RemoteDataSource{
    let networkService: NetworkServiceProtocol = AlamofireService()
    
    func getLeagues(sport: String, completion: @escaping (Result<LeagueResponse?, Error>) -> Void){
        networkService.getLeagues(sport: sport, completion: completion)
    }
}
