//
//  HomeViewController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 15/05/2025.
//

import UIKit
import Pastel

class HomeViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var headerCollectionView: UICollectionView!
    
    @IBOutlet weak var containerCollectionView: UICollectionView!
    
    // MARK: Properties
    var sportItems: [Sport] = [
        Football(sportName: "football", assetName: "1"),
        Tennisball(sportName: "tennis", assetName: "2"),
        Basketball(sportName: "basketball", assetName: "3"),
        Cricketball(sportName: "cricket", assetName: "4"),
    ]
    
    var slidesData: [UIImage] = Array(1...7).map{UIImage(named: "\($0)")!}
    
    let spacing: CGFloat = 8
    
    var timer: Timer?
    
    var currentCellIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        xibRegister()
        startTimer()
        containerCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        setBackGroundAnimation()
    }
}

extension HomeViewController{
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(nextImage), userInfo: nil, repeats: true)
    }
    
    @objc func nextImage(){
        if currentCellIndex < slidesData.count - 1{
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        headerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension HomeViewController{
    func setBackGroundAnimation(){
        let pastelView1 = PastelView(frame: view.bounds)

            // Custom Direction
            pastelView1.startPastelPoint = .bottomLeft
            pastelView1.endPastelPoint = .topRight

            // Custom Duration
            pastelView1.animationDuration = 3.0

            // Custom Color
            pastelView1.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                                  UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                                  UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                                  UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                                  UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                                  UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                                  UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])

            pastelView1.startAnimation()
            view.insertSubview(pastelView1, at: 0)
    }
}
