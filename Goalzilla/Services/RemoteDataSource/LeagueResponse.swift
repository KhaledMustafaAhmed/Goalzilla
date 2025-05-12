//
//  LeagueResponse.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

// MARK: - Root Response
struct LeagueResponse: Codable {
    let success: Int?
    let result: [League]?
}

// MARK: - League Info
struct League: Codable {
    let leagueKey: Int?
    let leagueName: String?
    let countryKey: Int?
    let countryName: String?
    let leagueLogo: String?
    let countryLogo: String?

    // MARK: - Coding keys to Match JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}
