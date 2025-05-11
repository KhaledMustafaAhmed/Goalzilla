//
//  RemoteDataSource.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol RemoteDataSource{
    
    func getEvents(league:League , time:String) -> [Event]
    func getLeagues(sport: Sport) -> [League]
    func getTeams(league: League) -> [Team]
    func getTeamMembers(teamId: Int) -> Team
    
}
