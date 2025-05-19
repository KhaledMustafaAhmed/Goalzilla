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
    
    var upcomingEventsData: [EventDataMapper] = []
    
    var latestEventsData: [EventDataMapper] = []
    
    var teamData: [TeamDataMapper] = []
    
    var presenter: EventScreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.isScrollEnabled = true
        presenter = EventScreenPresenter(eventView: self, providerService: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource()))
        registerCells()
        configureNAvigationBar()
        presenterConfigration()
        
    }
    
    
}
// MARK:  Presenter Configuration
extension EventsCollectionViewController{
    
    private func presenterConfigration(){
        presenter.fetchEvent(with: .upcoming, sport: sport, leagueId: leagueId)
        presenter.fetchEvent(with: .latest, sport: sport, leagueId: leagueId)
 
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        var group:NSCollectionLayoutGroup!
        let upComingEventItem = CompostionalLayout.createItem(width: .fractionalWidth(0.99), height: .fractionalHeight(1.0), spacing: 10)
        let latestEventItem = CompostionalLayout.createItem(width: .fractionalWidth(0.99), height: .fractionalHeight(1.0), spacing: 10)
        let teamItem = CompostionalLayout.createItem(width: .fractionalWidth(0.9), height: .fractionalHeight(1.0), spacing: 10)
        let layout = UICollectionViewCompositionalLayout{ sectionIndex , enviroment in
        var section: NSCollectionLayoutSection!
            switch(sectionIndex){
            case 0:
                group = CompostionalLayout.creatGroup(alignment: .horizontal, width: .fractionalWidth(0.9), height: .fractionalHeight(0.3), item:upComingEventItem, count: 1)
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
            case 1:
                group = CompostionalLayout.creatGroup(alignment: .vertical, width: .fractionalWidth(1.0), height: .fractionalHeight(0.3), item:latestEventItem, count: 1 )
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
            default:
                group = CompostionalLayout.creatGroup(alignment: .horizontal, width: .fractionalWidth(0.9), height: .fractionalHeight(0.3), item:teamItem, count:1)
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
            }
         
            return section
            
            
            
            
        }
        return layout
    }
    
}


// MARK: Event View States:
extension EventsCollectionViewController: EventsCollectionViewControllerProtocol{
    func latestDataLoaded(with data: [EventDataMapper]) {        
        self.latestEventsData = data
        collectionView.reloadData()
        collectionView.collectionViewLayout = createLayout()

    }
    
    func teamDataLoaded(with data: [TeamDataMapper]) {
        self.teamData = data
        collectionView.reloadData()
        collectionView.collectionViewLayout = createLayout()

    }
    
    func upcomingDataLoaded(with data: [EventDataMapper]) {
        self.upcomingEventsData = data
        collectionView.reloadData()
        collectionView.collectionViewLayout = createLayout()

    }
}
