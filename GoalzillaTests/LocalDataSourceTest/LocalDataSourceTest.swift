//
//  dummyFile6.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 20/05/2025.
//

@testable import Goalzilla
import XCTest

class LocalDataSourceTest : XCTestCase{
    
    var localDataSource:LocalDataSourceProtocol!
    
    override func setUp() {
        super.setUp()
        self.localDataSource =  LocalDataSource(favouriteModelManager: FavourtieModelManagerFake())
    }
    
    func testAddLeagueToFavouritesAddsLeagueSuccessfully() {
           let item = FavouritesModel(leagueId: 1, leagueName: "La Liga", leagueLogo: "laliga.png", sportName: "football")
           localDataSource.addLeagueToFavourites(item)
           let all = localDataSource.getAllFavourites()
           XCTAssertNotNil(all)
           XCTAssertEqual(all?.count, 1)
           XCTAssertEqual(all?.first?.leagueId, 1)
           XCTAssertEqual(all?.first?.leagueName, "La Liga")
       }

       func testRemoveLeagueFromFavouritesRemovesLeagueSuccessfully() {
           let item = FavouritesModel(leagueId: 2, leagueName: "Serie A", leagueLogo: "seriea.png", sportName: "football")
           localDataSource.addLeagueToFavourites(item)
           
           let deleted = localDataSource.removeLeagueFromFavourites(item)
           XCTAssertTrue(deleted)
           XCTAssertEqual(localDataSource.getAllFavourites()?.count, 0)
       }
       
       func testCheckIfLeagueAtFavouriteReturnsTrueIfExists() {
           let item = FavouritesModel(leagueId: 3, leagueName: "Egyptian Legue", leagueLogo: "test.png", sportName: "football")
           localDataSource.addLeagueToFavourites(item)
           XCTAssertTrue(localDataSource.checkifLeagueAtFavourite(leagueId: 3))
       }
       
       func testCheckIfLeagueAtFavourite_ReturnsFalseIfNotExist() {
           XCTAssertFalse(localDataSource.checkifLeagueAtFavourite(leagueId: 99))
       }
    
    
}
