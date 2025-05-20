//
//  Untitled.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 20/05/2025.
//

@testable import Goalzilla

class MockOnBoardingView: OnBoardingViewDelegete{
    
    var didCallRenderOnBoardingSlidesData: Bool = false
    
    var renderOnBoardingSlidesDataCalledWithData: [Goalzilla.OnBoardingSlide]?
    
    func renderOnBoardingSlidesData(data: [Goalzilla.OnBoardingSlide]) {
        didCallRenderOnBoardingSlidesData = true
        renderOnBoardingSlidesDataCalledWithData = data
    }
}
