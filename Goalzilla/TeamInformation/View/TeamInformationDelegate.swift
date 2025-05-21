//
//  TeamInformationDelegate.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 21/5/25.
//

protocol TeamInformationDelegate{
    func renderPlayersDataOfTeam(teamPlayers:[Player])
    func renderNetworkDisconnected()
    func renderNoPlayersFounded()
}
