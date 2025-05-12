//
//  LocalDataSource.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 10/5/25.
//

protocol LocalDataSource{
    func addTeamInFavourite(team: Team) -> Void
    func removeTeamFromFavourite(team: Team) -> Void
}
