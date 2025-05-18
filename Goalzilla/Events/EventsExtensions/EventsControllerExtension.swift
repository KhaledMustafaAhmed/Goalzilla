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
        // write code for register event cell
    }
    
    func teamCellRegister(){
        // write code for register team cell
    }
}

// MARK: UICollectionViewDataSource
extension EventsCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // switch on section
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
        return cell
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
