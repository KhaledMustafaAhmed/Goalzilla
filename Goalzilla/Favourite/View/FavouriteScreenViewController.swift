//
//  FavouriteScreenViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 19/5/25.
//

import UIKit
import Kingfisher
import SkeletonView
class FavouriteScreenViewController: UIViewController, FavouriteScreenProtocol {
  
    @IBOutlet weak var tableView: UITableView!
    
    var leagues:[FavouritesModel] = []
    var sport:String!
    var presenter:FavouritePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.presenter = FavouritePresenter(favouriteScreenView: self, provider: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource(favouriteModelManager: FavouritesModelManager())))
        presenter?.getFavouriteLeagues()
        self.view.isSkeletonable = true
        
        print("in view did load fav")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getFavouriteLeagues()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.isSkeletonable = true
    }

    func renderFavouriteData(leagueList:[FavouritesModel]) {
        self.leagues = leagueList
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        self.tableView.reloadData()	
        self.tableView.register(SportLeagueTableViewCell.nib, forCellReuseIdentifier:SportLeagueTableViewCell.resuseIdentifier)
    }
    
    func renderEmptyDataView() {
        print("Empty Favourite")
    }
    
    func failToGetLeaguesData() {
        print("Fialed to Get Data")
        tableView.hideSkeleton()
    }

}

extension FavouriteScreenViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: SportLeagueTableViewCell.resuseIdentifier) as! SportLeagueTableViewCell
        if leagues.isEmpty {
            let gradient = SkeletonGradient(baseColor: .concrete)
            let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
            cell.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation, transition: .crossDissolve(0.25))
            } else {
                let currentLeague = leagues[indexPath.row]
                let placeholder = Utils.sportPlaceholderImage(for: currentLeague.leagueLogo)
                if let url = URL(string: currentLeague.leagueLogo) {
                    cell.leagueImage.kf.setImage(with: url, placeholder: placeholder)
                } else {
                    cell.leagueImage.image = placeholder
                }
                cell.leagueLabel.text = currentLeague.leagueName
                cell.hideSkeleton()

            }
            return cell

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {

        guard editingStyle == .delete else { return }

        let leagueToRemove = leagues[indexPath.row]

       
        let alert = UIAlertController(title: "Delete",
                                      message: "Remove this league from favourites?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
            
            self.leagues.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.presenter?.removeLeagueFromFavourite(league: leagueToRemove)
            
            if self.leagues.isEmpty {
                self.renderEmptyDataView()
            }
        })

        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventsVC = self.storyboard?.instantiateViewController(withIdentifier: "EventsCollectionViewController") as! EventsCollectionViewController
        eventsVC.leagueId = self.leagues[indexPath.row].leagueId
        eventsVC.leagueLogo = self.leagues[indexPath.row].leagueLogo
        eventsVC.leagueName = self.leagues[indexPath.row].leagueName
        eventsVC.sport = self.leagues[indexPath.row].sportName

        self.navigationController?.pushViewController(eventsVC, animated: true)
    }

}
