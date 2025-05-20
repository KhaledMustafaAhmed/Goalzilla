//
//  EventsControllerExtension.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 18/05/2025.
//

import UIKit

// MARK: Configure Navigation Bar Data
extension EventsCollectionViewController{
    
    func configureNAvigationBar(){
        self.navigationItem.title = "Events"
        let isAtFavourite = self.presenter.checkifLeagueAtFavourite(leagueId: self.leagueId)
        
        if isAtFavourite{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(leagueToFavouriteAction))
        }else{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(leagueToFavouriteAction))
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
        self.collectionView.register(EventCell.nib, forCellWithReuseIdentifier: EventCell.resuseIdentifier)
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
                                   .dequeueReusableCell(withReuseIdentifier: EventCell.resuseIdentifier,
                                                        for: indexPath) as? EventCell else { fatalError() }
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
                                   .dequeueReusableCell(withReuseIdentifier: EventCell.resuseIdentifier,
                                                        for: indexPath) as? EventCell else { fatalError() }
                cell.setData(event: match)
                return cell
            }else{
                guard let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: EmptyEventsCell.resuseIdentifier,
                                                        for: indexPath) as? EmptyEventsCell else { fatalError() }
                cell.configureCell(eventType: "latest")

                return cell
            }
         
//           case 0, 1:
//               guard let cell = collectionView
//                   .dequeueReusableCell(withReuseIdentifier: EventCell.resuseIdentifier,
//                                        for: indexPath) as? EventCell else { fatalError() }
//            
//               let match = (indexPath.section == 0)
//                          ? upcomingEventsData[indexPath.row]
//                          : latestEventsData[indexPath.row]
//            cell.setData(event: match)
//               return cell

           default:
               guard let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.resuseIdentifier,
                                        for: indexPath) as? TeamCollectionViewCell else { fatalError() }


            cell.setData(team: teamData[indexPath.row])
            cell.layer.borderWidth = 5
            cell.layer.borderColor = UIColor.red.cgColor
            cell.layer.cornerRadius = 50
               return cell
           }
    }
    
    
}


// MARK: UICollectionViewDelegate
extension EventsCollectionViewController{
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}
