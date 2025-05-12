//
//  EventsResponse.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//
import Foundation

struct EventsResponse : Codable{
    var success:Int
    var result:[Event]
}
