//
//  TeamMapper.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 18/05/2025.
//

struct TeamDataMapper{
    let id: Int?
    let name: String?
    let logo: String?
    
    private init(id: Int?, name: String?, logo: String?) {
        self.id = id
        self.name = name
        self.logo = logo
    }
    
    private init(){
        self.init(id: nil, name: nil, logo: nil)
    }
}

extension TeamDataMapper{
    static func creatTeamMapper<T: Codable>(with data: T) -> TeamDataMapper{
        switch data {
            case let footballTeam as FootballTeam:
            return .init(id: footballTeam.teamKey, name: footballTeam.teamName, logo: footballTeam.teamLogo)
            case let cricketTeam as CrackitTeam:
            return .init(id: cricketTeam.teamKey, name: cricketTeam.teamName, logo: cricketTeam.teamLogo)
            case let basketballTeam as BasketballTeam:
            return .init(id: basketballTeam.teamKey, name: basketballTeam.teamName, logo: basketballTeam.teamLogo)
            case let tennisPlayers as TennisRanking:
            return .init(id: tennisPlayers.playerKey, name: tennisPlayers.player, logo: nil)
            default:
            return .init()
        }
    }
}
