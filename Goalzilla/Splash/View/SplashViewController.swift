//
//  SplashViewController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 15/05/2025.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    //MARK: Outlets:
    @IBOutlet private weak var lottieAnimationView: UIView!
    
    //MARK: Variables
    var navigationToMainFlag: Bool!
    var splashPresenter: SplashScreenPresenterProtocol!
    
    //MARK: UIViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splashPresenter = SplashScreenPresenter(splashView: self)
        
        splashPresenter.whichScreenWillNavigateTo()
        
        setupLottieAnimation(for: 5.0)
    }
}

//MARK: Lottie Animation Setup Function for some seconds
extension SplashViewController{
    private func setupLottieAnimation(for duration: TimeInterval){
        
        let animationView = LottieAnimationView(name: "lottie-splash")
        
        animationView.contentMode = .scaleAspectFit
        
        animationView.frame = self.lottieAnimationView.bounds
        
        animationView.loopMode = .loop
        
        self.lottieAnimationView.addSubview(animationView)
        
        animationView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
            self?.setupNavigationToComingScreen()
        }
    }
}

// MARK: Navigation Functions
extension SplashViewController{
    private func setupNavigationToComingScreen(){
        if navigationToMainFlag {
            navigateToMainScreen()
        }else{
            print(navigationToMainFlag ?? "flag is nil")
            
            navigateToOnboardingScreen()
        }
    }
    
    private func navigateToOnboardingScreen(){
        let onboardingScreen = storyboard?.instantiateViewController(withIdentifier: "OnBoarding") as! OnBoardingViewController
        self.navigationController?.pushViewController(onboardingScreen, animated: true)
    }
    
    private func navigateToMainScreen(){
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeViewController
        
        self.navigationController?.pushViewController(homeScreen, animated: true)
    }
}
