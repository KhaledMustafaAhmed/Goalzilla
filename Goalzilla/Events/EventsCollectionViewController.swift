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
    func renderAddingToFavouriteAction()
    func renderRemoveFromFavouriteAction()
    
}
    
class EventsCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
        
    var sport : String!
    
    var leagueId: Int!
    
    var upcomingEventsData: [EventDataMapper] = []

    var leagueName: String!
    
    var leagueLogo: String!
    
    
    var latestEventsData: [EventDataMapper] = []
    
    var teamData: [TeamDataMapper] = []
    
    var presenter: EventScreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.isScrollEnabled = true
        presenter = EventScreenPresenter(eventView: self, providerService: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource(favouriteModelManager:  FavouritesModelManager())))
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
        presenter.fetchTeamData(for: sport, leagueId: leagueId)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        var group:NSCollectionLayoutGroup!
        let upComingEventItem = CompostionalLayout.createItem(width: .fractionalWidth(0.99), height: .fractionalHeight(1.0), spacing: 10)
        let latestEventItem = CompostionalLayout.createItem(width: .fractionalWidth(0.99), height: .fractionalHeight(1.0), spacing: 10)
        let teamItem = CompostionalLayout.createItem(width: .fractionalWidth(0.9), height: .fractionalHeight(1.0), spacing: 10)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                 layoutSize: headerSize,
                 elementKind: UICollectionView.elementKindSectionHeader,
                 alignment: .top)

        
        
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
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
        return layout
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseIdentifier,for: indexPath) as! SectionHeaderView
            
            let title: String
            switch indexPath.section {
            case 0:
                title = "Upcoming Events"
            case 1:
                title = "Latest Events"
            default:
                title = "Teams"
            }
            headerView.configure(with: title)
            
            return headerView
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
    
    func renderAddingToFavouriteAction() {
        self.configureNAvigationBar()
    }
    
    func renderRemoveFromFavouriteAction() {
        self.configureNAvigationBar()
    }
}

