//
//  API.Constants.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 12/05/2025.
//

/// A container for API-related configuration constants used throughout the app.
///
/// ## Contents:
/// - `apiKey`: The API key required to authenticate requests with the AllSports API.
/// - `baseURL`: The root URL for all network requests to the AllSports API.
///
/// ## Usage Example:
/// ```swift
/// let url = "\(Constants.baseURL)/football"
/// let key = Constants.apiKey
/// ```
struct Constants {
    static let apiKey = "8423d660d1ff01d7e3352964ce26a41d821c1adc584df17efa5fd0587403b2de"
    static let baseURL = "https://apiv2.allsportsapi.com"
    static let from = Utils.calcSevenDaysBefore()
    static let to = Utils.getYesterDay()
    // write function to get dates
    static let upcomingFrom = Utils.getImmediateDate()
    static let upcomingTo = Utils.calcSevenDaysComming()
}
