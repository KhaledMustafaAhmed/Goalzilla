//
//  RemoteDataSource.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

protocol RemoteDataSource{
    
    func getEvents(league:League , time:String) -> [Event]
    func getLeagues(sport: Sport) -> [League]
    func getTeams(league: League) -> [Team]
    func getTeamMembers(teamId: Int) -> Team
    
class RemoteDataSource{
    let networkService: NetworkServiceProtocol = AlamofireService()
    
    func getLeagues(sport: String, completion: @escaping (Result<LeagueResponse?, Error>) -> Void){
        networkService.getLeagues(sport: sport, completion: completion)
    }
}
