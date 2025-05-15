//
//  SportLeaguesTableViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import UIKit

class SportLeaguesTableViewController: UITableViewController , SportLeaguesDelegete {

    var sport:String!
    
    var presenter:SportLeaguesPresenter = SportLeaguesPresenter(provider: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource()))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.presenter.attachView(view: self)
//        self.presenter.getLeaguesData(sport)
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

   

}
