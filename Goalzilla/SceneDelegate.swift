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
        var controller:UIViewController!
        
        if UserDefaults.standard.hasOnBoarded {
            controller = storyboard.instantiateViewController(withIdentifier: "DummyVC")
        }else{
            controller = storyboard.instantiateViewController(withIdentifier: "OnBoarding")
        }
        
        window?.rootViewController = controller
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
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

