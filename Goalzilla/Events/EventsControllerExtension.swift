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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(addEventToFavourite))
    }
    
    @objc func addEventToFavourite(){
        // write add to CoreData Logic
    }
}

// MARK: custom cells registeration
extension EventsCollectionViewController{
    func registerCells(){
        eventCellRegister()
        teamCellRegister()
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
           case 0: return upcomingEventsData?.count ?? 0
           case 1: return latestEventsData?.count ?? 0
           default: return teamData?.count ?? 0
           }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
           case 0, 1:
               guard let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: EventCell.resuseIdentifier,
                                        for: indexPath) as? EventCell else { fatalError() }

               let match = (indexPath.section == 0)
                          ? upcomingEventsData[indexPath.item]
                          : latestEventsData[indexPath.item]
            cell.setData(event: match)
               return cell

           default:
               guard let cell = collectionView
                   .dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.resuseIdentifier,
                                        for: indexPath) as? TeamCollectionViewCell else { fatalError() }

            cell.layer.borderWidth = 5
            cell.layer.borderColor = UIColor.red.cgColor
            cell.layer.cornerRadius = 50
               cell.setData(team: teamData[indexPath.item])
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
