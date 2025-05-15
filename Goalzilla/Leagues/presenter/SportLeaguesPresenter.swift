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
    
    func getLeaguesData(sport:Sport){
//        switch sport {
//        case :
//            <#code#>
//        default:
//            <#code#>
//        }
    }
}
