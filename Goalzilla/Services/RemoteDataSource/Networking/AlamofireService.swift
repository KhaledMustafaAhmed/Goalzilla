//
//  AlamofireService.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 11/05/2025.
//

import Alamofire

/// Concrete implementation of NetworkService using Alamofire
///
/// ## Responsibilities:
/// 1. Executes all network requests for the app
/// 2. Handles request construction and validation
/// 3. Parses responses into Decodable models
///
/// ## Conformance:
/// - `NetworkServiceProtocol`
///
/// ## Usage Example:
/// ```swift
/// let service = AlamofireService()
/// service.getLeagues(sport: "football") { result in
///     // Handle result
/// }
/// ```
class AlamofireService: NetworkServiceProtocol {
    /// Generic network request handler
        /// - Parameters:
        ///   - sport: The sport category (e.g., "football", "basketball")
        ///   - parameters: Dictionary of request parameters
        ///   - completion: Closure returning Result with decoded object or error
        ///
        /// ## Behavior:
        /// 1. Constructs URL using base URL and sport path
        /// 2. Executes GET request with URL-encoded parameters
        /// 3. Validates HTTP status code
        /// 4. Attempts to decode response into specified generic type
    func request<T: Decodable>(
        sport: String,
        parameters: [String: Any],
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = "\(Constants.baseURL)/\(sport)/"
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let responseData):
                    completion(.success(responseData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
