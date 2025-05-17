//
//  SportLeaguesPresenter.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

class SportLeaguesPresenter{
    
    var view:SportLeaguesDelegete!
    var provider:Provider!
    
    init (provider: Provider!) {
        self.provider = provider
    }
    
    func attachView(view: SportLeaguesDelegete){
        self.view = view
    }
    
    func getLeaguesData(sport:String){
        provider.getLeagues(with: sport) { result in
            switch result{
            case .success(let leaguesResponse):
                if let leagues = leaguesResponse?.result {
                    self.view.renderLeaguesData(leaguesList: leagues)
                }
            case .failure(_):
                self.view.failToGetLeaguesData()
            }
        }
    }
}
