//
//  FavouriteScreenViewController.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 19/5/25.
//

import UIKit
import Kingfisher
import SkeletonView
import Pastel
class FavouriteScreenViewController: UIViewController, FavouriteScreenProtocol {
  
    @IBOutlet weak var tableView: UITableView!
    
    var leagues:[FavouritesModel] = []
    var sport:String!
    var presenter:FavouritePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(SportLeagueTableViewCell.nib, forCellReuseIdentifier:SportLeagueTableViewCell.resuseIdentifier)
        
        self.presenter = FavouritePresenter(favouriteScreenView: self, provider: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource(favouriteModelManager: FavouritesModelManager())))
        presenter?.getFavouriteLeagues()
        self.view.isSkeletonable = true
        setBackGroundAnimation()
        configureNavigationBar()
    }
    
    func configureNavigationBar(){
        self.navigationItem.title = "Favourtie"
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

        if leagues.isEmpty {
            renderEmptyDataView()
        } else {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
        }
        
        self.tableView.reloadData()
    }
    
    func renderEmptyDataView() {
        if let emptyView = Bundle.main.loadNibNamed("EmptyTableViewCell", owner: nil, options: nil)?.first as? EmptyTableViewCell {
            emptyView.frame = self.tableView.bounds
            
            if let emptyImage = Utils.emptyFavourite {
                emptyView.targetImg.image = emptyImage
            }
            self.tableView.backgroundView = emptyView
            self.tableView.separatorStyle = .none
        }
    }
    
    func failToGetLeaguesData() {
        print("Failed to Get Data")
        tableView.hideSkeleton()
    }
}

extension FavouriteScreenViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SportLeagueTableViewCell.resuseIdentifier) as! SportLeagueTableViewCell
        
        let currentLeague = leagues[indexPath.row]
        let placeholder = Utils.sportPlaceholderImage(for: currentLeague.leagueLogo)
        
        if let url = URL(string: currentLeague.leagueLogo) {
            cell.leagueImage.kf.setImage(with: url, placeholder: placeholder)
        } else {
            cell.leagueImage.image = placeholder
        }
        
        cell.leagueLabel.text = currentLeague.leagueName
        cell.hideSkeleton()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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
            self.presenter?.removeLeagueFromFavourite(league: leagueToRemove)
            
            if self.leagues.isEmpty {
                self.tableView.reloadData()
                self.renderEmptyDataView()
            } else {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
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

extension FavouriteScreenViewController {
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
