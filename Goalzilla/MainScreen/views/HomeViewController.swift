//
//  HomeViewController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 15/05/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    // MARK: Properties
    var sportItems: [Sport] = [
        Football(sportName: "football", assetName: "pic-1"),
        Tennisball(sportName: "tennis", assetName: "pic-2"),
        Basketball(sportName: "basketball", assetName: "pic-3"),
        Cricketball(sportName: "cricket", assetName: "pic-4"),
    ]
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
