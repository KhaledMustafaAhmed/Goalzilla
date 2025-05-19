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
    static let apiKey = "f57e603cc5fc752af494be9504c227098f448a1d87a067fda7066a24b6328e9b"
    static let baseURL = "https://apiv2.allsportsapi.com"
    static let from = "2024-05-18"
    static let to = "2024-05-18"
    // write function to get dates
    static let upcomingFrom = "2025-05-18"
    static let upcomingTo = "2025-05-18"

}
