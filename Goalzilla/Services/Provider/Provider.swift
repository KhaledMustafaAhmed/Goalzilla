//
//  Provider.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol Provider{
    
    var remoteDataSource: RemoteDataSource {get}
    var localDataSource: LocalDataSource {get}
    
    func getEvents(league:League , time:String) -> [Event]
    func getLeagues(sport: Sport) -> [League]
    func getTeams(league: League) -> [Team]
    func getTeamMembers(teamId: Int) -> Team
    func addTeamInFavourite(team: Team) -> Void
    func removeTeamFromFavourite(team: Team) -> Void
    
}

