//
//  EventsCollectionViewController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 17/05/2025.
//

import UIKit

protocol EventsCollectionViewControllerProtocol{
    func upcomingDataLoaded(with data: [EventDataMapper])
    func latestDataLoaded(with data: [EventDataMapper])
    func teamDataLoaded(with data: [TeamDataMapper])
}
    
class EventsCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
        
    var sport : String!
    
    var leagueId: Int!
    
    var leagueName: String!
    
    var leagueLogo: String!
    
    var upcomingEventsData: [EventDataMapper]!
    
    var latestEventsData: [EventDataMapper]!
    
    var teamData: [TeamDataMapper]!
    
    var presenter: EventScreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = EventScreenPresenter(eventView: self, providerService: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource()))
        
        registerCells()
        
        collectionView.collectionViewLayout = createLayout()
        
        configureNAvigationBar()
        
        presenterConfigration()
    }
    
}
// MARK:  Presenter Configuration
extension EventsCollectionViewController{
    
    private func presenterConfigration(){
        presenter.fetchEvent(with: .upcoming, sport: sport, leagueId: leagueId)
        presenter.fetchEvent(with: .latest, sport: sport, leagueId: leagueId)
        presenter.fetchTeamData(for: sport, leagueId: leagueId)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        var group:NSCollectionLayoutGroup!
        let upComingEventItem = CompostionalLayout.createItem(width: .fractionalWidth(0.9), height: .fractionalHeight(1.0), spacing: 10)
        let latestEventItem = CompostionalLayout.createItem(width: .fractionalWidth(0.9), height: .fractionalHeight(1.0), spacing: 10)
        let teamItem = CompostionalLayout.createItem(width: .fractionalWidth(0.9), height: .fractionalHeight(1.0), spacing: 10)
        let layout = UICollectionViewCompositionalLayout{ sectionIndex , enviroment in
            
            switch(sectionIndex){
            case 0:
                group = CompostionalLayout.creatGroup(alignment: .horizontal, width: .fractionalWidth(1.0), height: .fractionalHeight(0.3), item:upComingEventItem, count: self.upcomingEventsData?.count ?? 1)
            case 1:
                group = CompostionalLayout.creatGroup(alignment: .vertical, width: .fractionalWidth(1.0), height: .fractionalHeight(0.3), item:latestEventItem, count: self.latestEventsData?.count ?? 1)
            default:
                group = CompostionalLayout.creatGroup(alignment: .horizontal, width: .fractionalWidth(1.0), height: .fractionalHeight(0.3), item:teamItem, count: self.teamData?.count ?? 1)
            }
            return NSCollectionLayoutSection(group: group)
        }
        return layout
    }
}

// MARK: Event View States:
extension EventsCollectionViewController: EventsCollectionViewControllerProtocol{
    func latestDataLoaded(with data: [EventDataMapper]) {
        self.latestEventsData = data
        collectionView.reloadData()
    }
    
    func teamDataLoaded(with data: [TeamDataMapper]) {
        self.teamData = data
        print("team data in event controller: \(self.teamData)")
       collectionView.reloadData()
    }
    
    func upcomingDataLoaded(with data: [EventDataMapper]) {
        self.upcomingEventsData = data
        collectionView.reloadData()
    }
}
