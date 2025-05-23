//
//  TeamInformationView.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 21/5/25.
//

import UIKit
import SkeletonView
class TeamInformationView: UITableViewController, TeamInformationDelegate {
    
    // MARK: - Properties
    var sport: String!
    var teamLogo: String!
    var leagueId: Int!
    var teamId: Int!
    var teamName: String!
    var team: [Player] = []
    
    private var headerView: TeamHeader?
    
    var showNoPlayersHeader: Bool = false
    var showNetworkDisconnectedHeader: Bool = false
    
    var presenter: TeamInformationPresenter = TeamInformationPresenter(provider: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource(favouriteModelManager: FavouritesModelManager())))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupHeader()
        self.navigationItem.title = teamName
        self.presenter.attachView(view: self)
        self.presenter.fetchData(sport: sport, leagueId: leagueId, teamId: teamId)
        self.tableView.isSkeletonable = true
        self.tableView.showSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
    }
    
    private func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        tableView.register(PlayerCustomCellTableViewCell.nib, forCellReuseIdentifier: PlayerCustomCellTableViewCell.resuseIdentifier)
        tableView.separatorStyle = .singleLine
    }
    
    private func setupHeader() {
        let headerHeight = view.frame.height * 0.3
        headerView = TeamHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: headerHeight))
        headerView?.configure(with: teamName, logoUrl: teamLogo)
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - TeamInformationDelegate
    
    func renderPlayersDataOfTeam(teamPlayers: [Player]) {
        showNoPlayersHeader = false
        showNetworkDisconnectedHeader = false
        self.team = teamPlayers
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        self.tableView.reloadData()
    }
    
    func renderNoPlayersFounded() {
        showNoPlayersHeader = true
        showNetworkDisconnectedHeader = false
        team.removeAll()
        tableView.reloadData()
    }
    
    func renderNetworkDisconnected() {
        showNoPlayersHeader = false
        showNetworkDisconnectedHeader = true
        team.removeAll()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source & delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showNoPlayersHeader || showNetworkDisconnectedHeader {
            return 0
        }
        return team.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerCustomCellTableViewCell.resuseIdentifier, for: indexPath) as! PlayerCustomCellTableViewCell
        
        if team.isEmpty {
            let gradient = SkeletonGradient(baseColor: .concrete)
            let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
            cell.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation, transition: .crossDissolve(0.25))
        } else {
            let player = self.team[indexPath.row]
            cell.configureCell(player: player)
        }
        
        cell.hideSkeleton()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if showNoPlayersHeader {
            let header = Bundle.main.loadNibNamed("NetworkDisconnectedCell", owner: self, options: nil)?.first as? NetworkDisconnectedCell
            header?.networkDisconnectImage.image = UIImage(named: "noplayers")
            return header
        }
        if showNetworkDisconnectedHeader {
            let header = Bundle.main.loadNibNamed("NetworkDisconnectedCell", owner: self, options: nil)?.first as? NetworkDisconnectedCell
            return header
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if showNoPlayersHeader || showNetworkDisconnectedHeader {
            return tableView.frame.height
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 10;
    }
    
}


// MARK: - Skeleton DataSource

extension TeamInformationView: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView,
                                numberOfRowsInSection section: Int) -> Int {
        return team.isEmpty ? 10 : team.count
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath)
                                -> ReusableCellIdentifier {
        return PlayerCustomCellTableViewCell.resuseIdentifier
    }
}
