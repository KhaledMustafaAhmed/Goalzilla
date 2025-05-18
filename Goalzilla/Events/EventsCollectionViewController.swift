//
//  EventsCollectionViewController.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 17/05/2025.
//

import UIKit

private let reuseIdentifier = "Cell"

class EventsCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    var sport : String!
    
    var upcomingEventsData: [EventDataMapper]!
    
    var latestEventsData: [EventDataMapper]!
    
    var teamData: [TeamDataMapper]!
    
    var presenter: EventScreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
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
