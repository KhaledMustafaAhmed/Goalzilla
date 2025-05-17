//
//  OnBoardingPresenter.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import Foundation

class OnBoardingPresenter {

    var onBoardingView:OnBoardingViewDelegete!
    
    func attachView(view:OnBoardingViewDelegete){
        self.onBoardingView = view
    }
    
    func getSlidesData() -> Void{
        onBoardingView.renderOnBoardingSlidesData(data: OnBoardingSlidesData.slides)
    }
    
    func userHasOnBoarded()->Void{
        UserDefaults.standard.hasOnBoarded = true
    }
}
