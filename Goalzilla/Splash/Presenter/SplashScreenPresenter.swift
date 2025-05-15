//
//  SplashScreenPresenter.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 15/05/2025.
//

import Foundation

protocol SplashScreenPresenterProtocol {
    func whichScreenWillNavigateTo() 
}

class SplashScreenPresenter: SplashScreenPresenterProtocol{
    
    var splashView: SplashViewController!
    
    init(splashView: SplashViewController!) {
        self.splashView = splashView
    }
    
    func whichScreenWillNavigateTo() {
        splashView.navigationToMainFlag =  UserDefaults.standard.hasOnBoarded
    }
}
