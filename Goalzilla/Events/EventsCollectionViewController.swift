//
//  EventsCollectionViewController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 17/05/2025.
//

import UIKit

    
class EventsCollectionViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    var sport : String!
    
    var upcomingEventsData: [EventDataMapper]!
    
    var latestEventsData: [EventDataMapper]!
    
    var teamData: [TeamDataMapper]!
    
    var presenter: EventScreenPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNAvigationBar()
        presenterConfigration()
    }
    
}
// MARK:  Presenter Configuration
extension EventsCollectionViewController{
    private func presenterConfigration(){
        presenter = EventScreenPresenter(eventView: self, providerService: ProviderConfirmation(remoteDataSource: RemoteDataSource(networkService: AlamofireService()), localDataSource: LocalDataSource()))
        //presenter.fetchEvent(with: .upcoming, sport: sport, leagueId: 1)
       // presenter.fetchEvent(with: .latest, sport: sport, leagueId: 1)
      //presenter.fetchTeamData(for: sport, leagueId: 3)
    }
        
    }
    
    func registerCells(){
        self.collectionView.register(EventCell.nib, forCellWithReuseIdentifier: EventCell.resuseIdentifier)
        self.collectionView.register(TeamCollectionViewCell.nib, forCellWithReuseIdentifier: TeamCollectionViewCell.resuseIdentifier)
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        	
        return cell
    }

}
