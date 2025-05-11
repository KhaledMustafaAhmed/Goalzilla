//
//  ProviderConfirmation.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//

class ProviderConfirmation : Provider{
    
    var remoteDataSource: any RemoteDataSource
    var localDataSource: any LocalDataSource
    
    init(remoteDataSource: any RemoteDataSource, localDataSource: any LocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    
    func getEvents(league: League, time: String) -> [Event] {
        return [];
    }
    
    func getLeagues(sport: Sport) -> [League] {
        return [];
    }
    
    func getTeams(league: League) -> [Team] {
        return [];
    }
    
    func getTeamMembers(teamId: Int) -> Team {
        return Team(teamKey: nil, teamName: nil, teamLogo: nil, players: [])
    }
    
    func addTeamInFavourite(team: Team) {
        return
    }
    
    func removeTeamFromFavourite(team: Team) {
        return
    }
    
    
}
