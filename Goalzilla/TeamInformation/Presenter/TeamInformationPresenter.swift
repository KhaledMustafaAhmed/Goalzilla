//
//  TeamInformationPresenter.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 21/5/25.
//


protocol TeamInformation{
    func fetchData(sport:String,leagueId:Int ,teamId:Int)
}

class TeamInformationPresenter: TeamInformation{
    
    var view:TeamInformationDelegate!
    var provider:Provider!
    
    init (provider: Provider!) {
        self.provider = provider
    }
    
    func attachView(view: TeamInformationDelegate){
        self.view = view
    }
    
    func fetchData(sport:String,leagueId:Int ,teamId:Int){
        provider.getFootballTeams(with: sport, leagueId: leagueId) { result in
            switch result{
            case .success(let teamResponse):
                if let players = teamResponse?.result?.first?.players{
                    self.view.renderPlayersDataOfTeam(teamPlayers: players)
                }
            case .failure(_):
                self.view.renderNetworkDisconnected()
            }
        }
    }

}


