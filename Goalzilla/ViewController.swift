//
//  ViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 8/5/25.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEvents(forLeagueId: 124)
        fetchLeagues(forCountryId: 54)
        
        let x = Repository()

        x.getLeagues(sport: "football") { (result) in
            switch result{
            case .success(let Leagues):
                print(Leagues?.result?[0].leagueName ?? "No data found")
            case .failure(_):
                print("Error in view controller")
            }
        }
    }
}

