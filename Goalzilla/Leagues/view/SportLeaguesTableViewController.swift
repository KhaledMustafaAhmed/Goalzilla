//
//  SportLeaguesTableViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import UIKit
import Kingfisher
import SkeletonView
import ShimmerView

class SportLeaguesTableViewController: UITableViewController , SportLeaguesDelegete{

    var sport:String = "football"
    var leaguesList:[League] = []
    
    var presenter:SportLeaguesPresenter = SportLeaguesPresenter(provider: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource(favouriteModelManager: FavouritesModelManager())))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(SportLeagueTableViewCell.nib, forCellReuseIdentifier: SportLeagueTableViewCell.resuseIdentifier)
        self.presenter.attachView(view: self)
        self.presenter.getLeaguesData(sport: sport)
        self.tableView.isSkeletonable = true
        self.tableView.showSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func failToGetLeaguesData() {
        print("Fialed to Get Data")
        tableView.hideSkeleton()
    }
    
    func renderLeaguesData(leaguesList: [League]) {
        self.leaguesList = leaguesList
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        self.tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return leaguesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SportLeagueTableViewCell.resuseIdentifier, for: indexPath) as! SportLeagueTableViewCell
        if leaguesList.isEmpty {
            //cell.showAnimatedGradientSkeleton()
            let gradient = SkeletonGradient(baseColor: .concrete)
            let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
            cell.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation, transition: .crossDissolve(0.25))
            } else {
                let currentLeague = leaguesList[indexPath.row]
                let placeholder = Utils.sportPlaceholderImage(for: sport)
                if let logoURL = currentLeague.leagueLogo, let url = URL(string: logoURL) {
                    cell.leagueImage.kf.setImage(with: url, placeholder: placeholder)
                } else {
                    cell.leagueImage.image = placeholder
                }
                cell.leagueLabel.text = currentLeague.leagueName
                cell.hideSkeleton()
//                cell.stopShimmer()
            }
            return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
}

extension SportLeaguesTableViewController: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView,
                                numberOfRowsInSection section: Int) -> Int {
        return leaguesList.isEmpty ? 10 : leaguesList.count
    }

    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath)
                                -> ReusableCellIdentifier {
        SportLeagueTableViewCell.resuseIdentifier	
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventsVC = self.storyboard?.instantiateViewController(identifier: "EventsCollectionViewController") as! EventsCollectionViewController
        eventsVC.sport = self.sport
        eventsVC.leagueName = leaguesList[indexPath.row].leagueName
        eventsVC.leagueId = leaguesList[indexPath.row].leagueKey
        eventsVC.leagueLogo = leaguesList[indexPath.row].leagueLogo
        self.navigationController?.pushViewController(eventsVC, animated: true)
    }
}
