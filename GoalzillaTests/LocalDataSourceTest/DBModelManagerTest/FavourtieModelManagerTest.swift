//
//  FavourtieModelManagerTest.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//
@testable import Goalzilla
import XCTest

class FavourtieModelManagerTest: XCTestCase{
    
    var dbManager:FavouritesModelManagerProtocol!
    
    override func setUp() {
        super.setUp()
        self.dbManager = FavourtieModelManagerFake()
    }
    
    func testAddFavourite_AddsItemToFavourites(){
        let favouriteItem = FavouritesModel(leagueId: 10, leagueName: "La Liga", leagueLogo: "test.jpg", sportName: "football")
        dbManager.add(favouriteItem)
        
        let allFavourites = dbManager.fetchAll()
        XCTAssertNotNil(allFavourites)
        XCTAssertNotEqual(allFavourites?.count, 0)
        XCTAssertEqual(allFavourites?.count, 1)
        
        if let item = allFavourites?.first{
            XCTAssertEqual(item.leagueId, favouriteItem.leagueId)
            XCTAssertEqual(item.leagueLogo, favouriteItem.leagueLogo)
            XCTAssertEqual(item.leagueName, favouriteItem.leagueName)
        }
    }
    
    func testFetchAllWhenFavouriteExistReturnsAllFavourites(){
        let item1 = FavouritesModel(leagueId: 10, leagueName: "La Liga", leagueLogo: "test.jpg", sportName: "football")
        let item2 = FavouritesModel(leagueId: 11, leagueName: "La Liga ii", leagueLogo: "test.jpg", sportName: "football")
        
        dbManager.add(item1)
        dbManager.add(item2)
        
        let allFavourites = dbManager.fetchAll()
        XCTAssertNotNil(allFavourites)
        XCTAssertEqual(allFavourites?.count, 2)
    }
    
    func testFetchAllWhenFavouriteNotExistReturnsEmpty(){
        let allFavourites = dbManager.fetchAll()
        XCTAssertEqual(allFavourites?.count, 0 )
    }
    
    
    func testDeleteFavourite_RemovesItemFromFavourite(){
        let favouriteItem = FavouritesModel(leagueId: 10, leagueName: "La Liga", leagueLogo: "test.jpg", sportName: "football")
        dbManager.add(favouriteItem)
        var allFavourites =  dbManager.fetchAll()
        XCTAssertEqual(allFavourites?.count, 1)
    
        let _ = dbManager.delete(favouriteItem)
        allFavourites = dbManager.fetchAll()
        XCTAssertEqual(allFavourites?.count, 0)
    }

    func testDeleteItemNotExistReturnsFalse(){
        let favouriteItem = FavouritesModel(leagueId: 10, leagueName: "La Liga", leagueLogo: "test.jpg", sportName: "football")
        let result = dbManager.delete(favouriteItem)
        XCTAssertFalse(result)
    }
    
    func testSearchItemExist(){
        let favouriteItem = FavouritesModel(leagueId: 10, leagueName: "La Liga", leagueLogo: "test.jpg", sportName: "football")
        dbManager.add(favouriteItem)
        let result = dbManager.search(leagueId: favouriteItem.leagueId)
        XCTAssertTrue(result)
    }
    
    func testSearchItemNotExist(){
        let favouriteItem = FavouritesModel(leagueId: 10, leagueName: "La Liga", leagueLogo: "test.jpg", sportName: "football")
        let result = dbManager.search(leagueId: favouriteItem.leagueId)
        XCTAssertFalse(result)
    }
}
