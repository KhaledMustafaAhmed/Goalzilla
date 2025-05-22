//
//  Utils.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//
import UIKit
import Foundation

enum Utils {
    static func getDate() -> String{
        "dwdm"
    }
    static func isConnectedToNetwork() -> Bool{
        return true
    }
    static func sportPlaceholderImage(for sport: String) -> UIImage? {
        switch sport {
        case "football":
            return UIImage(named: "footballLeague")
        case "tennis":
            return UIImage(named: "tennisLeague")
        case "basketball":
            return UIImage(named: "basketballLeague")
        default:
            return UIImage(named: "cricketLeague")
        }
    }
    
    static func getImmediateDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date.now)
    }
    
    static func calcSevenDaysComming() -> String {
            let currentDate = Date.now
            let calendar = Calendar.current
            if let futureDate = calendar.date(byAdding: .day, value: 7, to: currentDate) {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                return formatter.string(from: futureDate)
            } else {
                return getImmediateDate()
            }
        }
    
    static var placeHolder = UIImage(named: "dummy")
    static var emptyFavourite = UIImage(named: "fav")
    static func emptyEventsPlaceHolder(for evetnType: String) -> UIImage? {
        switch evetnType {
        case "upcoming":
            return UIImage(named: "noUpcomingEvents")
        default:
            return UIImage(named: "noLatestEvents")
        }
    }
}
		
