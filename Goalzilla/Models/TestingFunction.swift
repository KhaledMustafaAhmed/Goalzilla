////
////  TestingFunction.swift
////  Goalzilla
////
////  Created by Abdelrahman Elshreif on 11/5/25.
////
//
//import Foundation
//
//func fetchEvents(forLeagueId leagueId: Int) {
//    let apiKey = "c1cf154114816f1a9cacbbcf52c8743cfc39d9977405c1585a2b4bec3748d711"
//    let urlString = "https://apiv2.allsportsapi.com/football/?&met=Fixtures&leagueId=\(leagueId)&APIkey=\(apiKey)&from=2021-05-01&to=2021-05-05"
//
//
//    guard let url = URL(string: urlString) else {
//        print("Invalid URL")
//        return
//    }
//
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        if let error = error {
//            print("Network error:", error)
//            return
//        }
//
//        guard let data = data else {
//            print("No data received.")
//            return
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            let response = try decoder.decode(EventsResponse.self, from: data)
//            print("Events loaded: \(response.result.count)")
//            print("\(response.result)\n")
////            for event in response.result {
////                print("🔹 \(event.homeTeam ?? "Home") vs \(event.secondTeam ?? "Away") — \(event.eventDate ?? "") at \(event.eventTime ?? "")")
////            }
//        } catch {
//            print("Decoding error:", error)
//            print(String(data: data, encoding: .utf8) ?? "Could not print raw response.")
//        }
//    }.resume()
//}
//
//
//
//
//func fetchLeagues(forCountryId countryId: Int) {
//    let apiKey = "c1cf154114816f1a9cacbbcf52c8743cfc39d9977405c1585a2b4bec3748d711"
//    let urlString = "https://apiv2.allsportsapi.com/football/?&met=Leagues&countryId=\(countryId)&APIkey=\(apiKey)"
//
//    guard let url = URL(string: urlString) else {
//        print("Invalid URL")
//        return
//    }
//
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        if let error = error {
//            print("Network error:", error)
//            return
//        }
//
//        guard let data = data else {
//            print("No data received.")
//            return
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            let response = try decoder.decode(LeaguesResponse.self, from: data)
//            print("Leagues loaded: \(response.result.count)")
//            print("\(response.result)\n")
//            
//        } catch {
//            print("Decoding error:", error)
//            print(String(data: data, encoding: .utf8) ?? " Could not print raw response.")
//        }
//    }.resume()
//}
//
//
