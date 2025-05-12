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
    
    let provider: Provider = ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource() )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //basketball, football, tennis, cricket
        provider.getTeams(with: "basketball", leagueId: 1098) { result in
            switch result{
            case .success(let teams):
                print(teams?.result[0].teamName ?? " no name")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

