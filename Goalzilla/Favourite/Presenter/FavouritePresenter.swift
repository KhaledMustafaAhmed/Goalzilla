//
//  FavouritePresenter.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 19/5/25.
//

class FavouritePresenter{
    
    var favouriteScreenView:FavouriteScreenProtocol!
    
    let provider:Provider
    
    init(favouriteScreenView: FavouriteScreenProtocol!, provider: Provider) {
        self.favouriteScreenView = favouriteScreenView
        self.provider = provider
    }
    
    func getFavouriteLeagues(){
        let data = provider.getAllFavourites()
        self.favouriteScreenView.renderFavouriteData(leagueList: data ?? [])
    }
    
    func removeLeagueFromFavourite(league:FavouritesModel){
        let _ = provider.removeLeagueFromFavourites(league)
        getFavouriteLeagues()
    }
    
    func checkifLeagueAtFavourite(leagueId:Int) ->Bool{
        provider.checkifLeagueAtFavourite(leagueId:leagueId)
    }
    
    func attachView(view:FavouriteScreenProtocol){
        self.favouriteScreenView = view
    }
}
