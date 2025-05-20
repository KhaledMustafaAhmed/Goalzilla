//
//  NetworkServicesFake.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

@testable import Goalzilla

class NetworkServicesFake : NetworkServiceProtocol{
    func request<T>(sport: String, parameters: [String : Any], completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable, T : Encodable {
        
    }
}
