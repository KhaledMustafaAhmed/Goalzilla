//
//  SportLeaguesTableViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import UIKit
import Kingfisher

class SportLeaguesTableViewController: UITableViewController , SportLeaguesDelegete {

    var sport:String = "tennis"
    var leaguesList:[League] = []
    
    var presenter:SportLeaguesPresenter = SportLeaguesPresenter(provider: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource()))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(SportLeagueTableViewCell.nib, forCellReuseIdentifier: SportLeagueTableViewCell.resuseIdentifier)
        
        self.presenter.attachView(view: self)
        self.presenter.getLeaguesData(sport: sport)
//        self.tableView.rowHeight = UITableView.automaticDimension
//        self.tableView.estimatedRowHeight = 120
    }
    
    func failToGetLeaguesData() {
        print("Fialed to Get Data")
    }
    
    func renderLeaguesData(leaguesList: [League]) {
        self.leaguesList = leaguesList
        self.tableView.reloadData()
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SportLeagueTableViewCell.resuseIdentifier, for: indexPath) as! SportLeagueTableViewCell
        let currentleague = leaguesList[indexPath.row]
        let placeholder = Utils.sportPlaceholderImage(for: sport)
        if let leagueLogo = currentleague.leagueLogo{
            cell.leagueImage.kf.setImage(with: URL(string: currentleague.leagueLogo!) , placeholder: placeholder)
        }else{
            cell.leagueImage.image = placeholder
        }
        cell.leagueLabel.text = currentleague.leagueName
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
}
