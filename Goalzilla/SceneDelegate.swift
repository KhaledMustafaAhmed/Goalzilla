//
//  SceneDelegate.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 8/5/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let splashVC = storyboard.instantiateViewController(withIdentifier: "SplashScreen") as! SplashViewController
        let navController = UINavigationController(rootViewController: splashVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()	
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {        
        CoreDataService.shared.saveContext()
    }
}

/*
 func convertCDFavLeagueToFavLeague() -> FavouritesModel {
     return FavouritesModel(leagueId: Int(self.leagueID), leagueName: self.leagueName ?? "no-data-returned", leagueLogo: self.leagueLogo ?? "no-data-returned")
 }
 */
