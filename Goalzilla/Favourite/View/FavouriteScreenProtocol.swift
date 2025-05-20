//
//  FavouriteScreenProtocol.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 19/5/25.
//

protocol FavouriteScreenProtocol{
    
    func renderFavouriteData(leagueList:[FavouritesModel])
    func renderEmptyDataView()
    func failToGetLeaguesData() 
}
