//
//  NetworkServiceTest.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 20/05/2025.
//

@testable import Goalzilla
import XCTest

final class NetworkServiceTest: XCTestCase {
    
    var fakeNetworkService: FakeNetworkService!
    
    override func setUpWithError() throws {
        fakeNetworkService = FakeNetworkService()
    }

    override func tearDownWithError() throws {
        fakeNetworkService = nil
    }
    
    // MARK: - Test GetLeagues Fail and Success:
    func testGetLeagues_ShouldSuccess() throws {
        
        let expectation = expectation(description: "Loaded league data Done")
        
        fakeNetworkService.getLeagues(sport: "football") { result in
            switch result {
                
            case .success(let leagues):
                
                XCTAssertEqual(leagues?.result?.count, 2)
                
            case .failure(let error):
                
                XCTFail("\(error.localizedDescription)")
                
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testGetLeagues_ShouldFail() throws {
        
        fakeNetworkService.shouldReturnWithError = true
        
        let expectation = expectation(description: "Loaded league data Done")
        
        fakeNetworkService.getLeagues(sport: "football", completion: {[weak self] result in
            switch result {
            case .success(let leagueResponse):
                XCTAssertTrue(leagueResponse?.result?.count == 2)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 3.0)
    }
    // MARK: - Test GetTeams For all sports Fail and Success:
    func testGetFootballTeams_ShouldSuccess() throws {
        
        let expectation = expectation(description: "Load Football team data Done")
        
        fakeNetworkService.getFootballTeams(sport: "football", leagueId: 1, completion: { result in
            switch result {
                case .success(let footballTeamsResponse):
                XCTAssertTrue(footballTeamsResponse?.result?.count == 2)
                case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testGetFootballTeams_ShouldFail() throws {
        
        fakeNetworkService.shouldReturnWithError = true
        
        let expectation = expectation(description: "Load Football team data Done")
        
        fakeNetworkService.getFootballTeams(sport: "football", leagueId: 1, completion: {[weak self] result in
            switch result {
                case .success(let footballTeamsResponse):
                XCTAssertTrue(footballTeamsResponse?.result?.count == 2)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetBasketballTeams_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Basketball team data Done")
        fakeNetworkService.getBasketballTeams(sport: "basketball", leagueId: 1, completion: { result in
            switch result {
            case .success(let basketballTeamsResponse):
                XCTAssertTrue(basketballTeamsResponse?.result?.count == 2)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetBasketballTeams_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Basketball team data Done")
        fakeNetworkService.getBasketballTeams(sport: "basketball", leagueId: 1, completion: {[weak self] result in
            switch result {
            case .success(let basketballTeamsResponse):
                XCTAssertTrue(basketballTeamsResponse?.result?.count == 2)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 3.0)
    }
        
    func testgetCrackitTeams_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Crackit team data Done")
        fakeNetworkService.getCrackitTeams(sport: "cricket", leagueId: 1) { result in
            switch result{
            case .success(let cricketResponse):
                XCTAssertTrue(cricketResponse?.result?.count == 2)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
    
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetCrackitTeams_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Crackit team data Done")
        fakeNetworkService.getCrackitTeams(sport: "cricket", leagueId: 1) {[weak self] result in
            switch result{
            case .success(let cricketResponse):
                XCTAssertTrue(cricketResponse?.result?.count == 2)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        }
    
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetTennisPlayersRanking_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Tennis player ranking Done")
        fakeNetworkService.getTennisPlayersRanking(sport: "tennis", leagueId: 1) { result in
            switch result{
            case .success(let tennisResponse):
                XCTAssertFalse(tennisResponse?.result?.count == 4)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetTennisPlayersRanking_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Tennis player ranking Done")
        fakeNetworkService.getTennisPlayersRanking(sport: "tennis", leagueId: 1) {[weak self] result in
            switch result{
            case .success(let tennisResponse):
                XCTAssertTrue(tennisResponse?.result?.count == 2)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    // MARK: - Test GetEvents For all sports Fail and Success:
    func testgetFootballEvents_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Football Events Done")
        fakeNetworkService.getFootballEvents(with: .upcoming, sport: "football", leagueId: 1) { result in
            switch result{
            case .success(let footballEvents):
                XCTAssertFalse(footballEvents?.result?.count == 3)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetFootballEvents_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Football Events Done")
        fakeNetworkService.getFootballEvents(with: .upcoming, sport: "football", leagueId: 1) {[weak self] result in
            switch result{
            case .success(let footballEvents):
                XCTAssertFalse(footballEvents?.result?.count == 3)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    
    func testgetBasketballEvents_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Basketball Events Done")
        fakeNetworkService.getBasketballEvents(with: .latest, sport: "basketball", leagueId: 1) { result in
            switch result{
            case .success(let basketballEvents):
                XCTAssertFalse(basketballEvents?.result?.count == 3)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }

    
    func testgetBasketballEvents_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Basketball Events Done")
        fakeNetworkService.getBasketballEvents(with: .latest, sport: "basketball", leagueId: 1) {[weak self] result in
            switch result{
            case .success(let basketballEvents):
                XCTAssertFalse(basketballEvents?.result?.count == 3)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetCrackitEvents_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Crackit Events Done")
        fakeNetworkService.getCrackitEvents(with: .upcoming, sport: "cricket", leagueId: 1) { result in
            switch result{
            case .success(let cricketEvent):
                XCTAssertFalse(cricketEvent?.result?.count == 3)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetCricketEvents_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Cricket Events Done")
        fakeNetworkService.getCrackitEvents(with: .upcoming, sport: "cricket", leagueId: 1) {[weak self] result in
            switch result{
            case .success(let cricketEvent):
                XCTAssertFalse(cricketEvent?.result?.count == 3)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testgetTennisEvents_ShouldSuccess() throws {
        let expectation = expectation(description: "Load Tennis Events Done")
        fakeNetworkService.getCrackitEvents(with: .upcoming, sport: "tennis", leagueId: 1) { result in
            switch result{
            case .success(let tennisEvent):
                XCTAssertFalse(tennisEvent?.result?.count == 3)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }

    func testgetTennisEvents_ShouldFail() throws {
        fakeNetworkService.shouldReturnWithError = true
        let expectation = expectation(description: "Load Tennis Events Done")
        fakeNetworkService.getCrackitEvents(with: .upcoming, sport: "tennis", leagueId: 1) {[weak self] result in
            switch result{
            case .success(let tennisEvent):
                XCTAssertFalse(tennisEvent?.result?.count == 3)
            case .failure(_):
                XCTAssertTrue(self?.fakeNetworkService.shouldReturnWithError == true)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
}
