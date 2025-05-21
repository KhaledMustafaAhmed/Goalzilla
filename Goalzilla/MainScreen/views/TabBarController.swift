//
//  TabBarController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 21/05/2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeRaduisOfTabBar()
        changeUnSelectedIcons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ChangeTabBarHeight()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        SimpleAnnimationWhenSelectItem(item)
    }
}

extension TabBarController {
    func changeRaduisOfTabBar(){
        self.tabBar.layer.cornerRadius = 100
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func changeUnSelectedIcons(){
        self.tabBar.tintColor = .silver
        self.tabBar.unselectedItemTintColor = .black
    }
    
    func ChangeTabBarHeight(){
        if UIDevice().userInterfaceIdiom == .phone{
            var tabFrame = self.tabBar.frame
            tabFrame.size.height = 90
            tabFrame.origin.y = view.frame.size.height - 90
            tabBar.frame = tabFrame
        }
    }
    
    func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem){
        
            guard let barItemView = item.value(forKey: "view") as? UIView else { return }

            let timeInterval: TimeInterval = 0.5
            let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.9, y: 1.9)
            }
            propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
            propertyAnimator.startAnimation()
        }
}
