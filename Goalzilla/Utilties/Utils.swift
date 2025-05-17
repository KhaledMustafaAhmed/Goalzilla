//
//  Utils.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//
import UIKit
import Foundation

enum Utils {
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
}
		
