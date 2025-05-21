//
//  EventsControllerExtension.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 18/05/2025.
//

import UIKit

// MARK: Configure Navigation Bar Data
extension EventsCollectionViewController{
    
    func configureNavigationBar() {
        self.navigationItem.title = "Events"
        let isAtFavourite = self.presenter.checkifLeagueAtFavourite(leagueId: self.leagueId)
        
        if isAtFavourite {
            let heartButton = UIBarButtonItem(
                image: UIImage(systemName: "heart.fill"),
                primaryAction: UIAction(handler: { [weak self] _ in
                    self?.leagueToFavouriteAction()
                })
            )
            
            heartButton.changesSelectionAsPrimaryAction = false
            heartButton.tintColor = .systemBlue
        
            self.navigationItem.rightBarButtonItem = heartButton
        } else {
            let heartButton = UIBarButtonItem(
                image: UIImage(systemName: "heart"),
                primaryAction: UIAction(handler: { [weak self] _ in
                    self?.leagueToFavouriteAction()
                })
            )
            heartButton.changesSelectionAsPrimaryAction = false
            self.navigationItem.rightBarButtonItem = heartButton
        }
    }
    
    @objc func leagueToFavouriteAction(){
        if let _ = self.leagueLogo{
            presenter.leagueToFavouriteAction(leagueId: self.leagueId, leagueLogo: self.leagueLogo , leagueTitle: self.leagueName)
        }else{
            presenter.leagueToFavouriteAction(leagueId: self.leagueId, leagueLogo: "\(self.sport ?? "")" , leagueTitle: self.leagueName)
        }
       
        
    }
}

// MARK: custom cells registeration
extension EventsCollectionViewController{	
    func registerCells(){
        registerSectionHeader()
        eventCellRegister()
        teamCellRegister()
        noEventsAvailableCell()
    }
    
    func noEventsAvailableCell(){
        self.collectionView.register(EmptyEventsCell.nib, forCellWithReuseIdentifier: EmptyEventsCell.resuseIdentifier)
    }
    func registerSectionHeader(){
        self.collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseIdentifier)

    }
    func eventCellRegister(){
//        self.collectionView.register(EventCell.nib, forCellWithReuseIdentifier: EventCell.resuseIdentifier)
        self.collectionView.register(EventCellVersionII.nib, forCellWithReuseIdentifier: EventCellVersionII.resuseIdentifier)
    }
    
    func teamCellRegister(){
        self.collectionView.register(TeamCollectionViewCell.nib, forCellWithReuseIdentifier: TeamCollectionViewCell.resuseIdentifier)
    }
}

// MARK: UICollectionViewDataSource
extension EventsCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3;
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
            let count =  upcomingEventsData.count > 0 ? upcomingEventsData.count : 1
                return count
            case 1:
            let count =  latestEventsData.count > 0 ? upcomingEventsData.count : 1
                return count
           default: return teamData.count
           }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            if upcomingEventsData.count >= 1 {
                let match = upcomingEventsData[indexPath.row]
                guard let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: EventCellVersionII.resuseIdentifier,
                                         for: indexPath) as? EventCellVersionII else { fatalError() }
                cell.setData(event: match)
                return cell
            }else{
                guard let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: EmptyEventsCell.resuseIdentifier,
                                                        for: indexPath) as? EmptyEventsCell else { fatalError() }
                cell.configureCell(eventType: "upcoming")
                return cell
            }
        case 1:
            if latestEventsData.count >= 1 {
                let match = upcomingEventsData[indexPath.row]
                guard let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: EventCellVersionII.resuseIdentifier,
                                         for: indexPath) as? EventCellVersionII else { fatalError() }
                cell.setData(event: match)
                return cell
            }else{
                guard let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: EmptyEventsCell.resuseIdentifier,
                                                        for: indexPath) as? EmptyEventsCell else { fatalError() }
                cell.configureCell(eventType: "latest")

                return cell
            }
           default:
               guard let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.resuseIdentifier,
                                        for: indexPath) as? TeamCollectionViewCell else { fatalError() }


            cell.setData(team: teamData[indexPath.row])
            cell.layer.cornerRadius = 40
               return cell
           }
    }
    
}
