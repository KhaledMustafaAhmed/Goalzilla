//
//  Sport.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 11/5/25.
//
protocol Sport{
    var sportName:String { get }
    var assetName:String { get }
}

struct Football:Sport{
    var sportName: String = "football"
    var assetName: String = "football.jpg"
}

struct Basketball:Sport{
    var sportName: String = "basketball"
    var assetName: String = "basketball.jpg"
}

struct Cricketball:Sport{
    var sportName: String = "cricket"
    var assetName: String = "cricket.jpg"
}

struct Tennisball:Sport{
    var sportName: String = "tennis"
    var assetName: String = "tennis.jpg"
}

