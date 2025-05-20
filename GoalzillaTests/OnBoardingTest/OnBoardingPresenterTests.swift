//
//  OnBoardingPresenterTests.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 20/05/2025.
//

@testable import Goalzilla
import XCTest

final class OnBoardingPresenterTests: XCTest{
    // MARK: - Properties:
    var onBoardingPresenter:OnBoardingPresenterProtocol!
    
    var mockOnBoardingView : MockOnBoardingView!
    
    // MARK: - setup enviroment
    override func setUpWithError() throws {
        onBoardingPresenter = OnBoardingPresenter()
        
        mockOnBoardingView = MockOnBoardingView()
        
        onBoardingPresenter.attachView(view: mockOnBoardingView)
    }
    // MARK: - tear down enviroment
    override func tearDownWithError() throws {
        onBoardingPresenter = nil
        
        mockOnBoardingView = nil
    }
    // MARK: - OnBoarding Presenter Test functions:
    func testGetSlidesData_WhenViewIsAttached_ShouldPassAndRenderSlides(){
        // When
        onBoardingPresenter.getSlidesData()
        // Then
        XCTAssertTrue(mockOnBoardingView.didCallRenderOnBoardingSlidesData == true)
        
        XCTAssertTrue(mockOnBoardingView.renderOnBoardingSlidesDataCalledWithData != nil)
    }
}
