//
//  LeaguesResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//

// It was Applicable for all Sports
struct LeaguesResponse : Codable{
    var success:Int?
    var result:[League]?
}

struct League:Codable{
    var leagueKey:Int?
    var leagueName:String?
    var leagueLogo:String?
    var countryLogo:String?
    var leagueCountry:String?
    var leagueCountryKey:Int?
    
    
    enum CodingKeys: String, CodingKey {
          case leagueKey = "league_key"
          case leagueName = "league_name"
          case leagueLogo = "league_logo"
          case countryLogo = "country_logo"
          case leagueCountry = "country_name"
          case leagueCountryKey = "country_key"
      }
}
