//
//  CollectionViewExtension.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 17/05/2025.
//

import UIKit

// MARK: UICollectionViewDelegate methods:
extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sportItems[indexPath.row].sportName)
        let sportsLeagueController = self.storyboard?.instantiateViewController(identifier: "sportLeagues") as! SportLeaguesTableViewController
        
        sportsLeagueController.sport = sportItems[indexPath.row].sportName
        
        self.navigationController?.pushViewController(sportsLeagueController, animated: true)
    }
}

// MARK: UICollectionViewDelegateFlowLayout methods:
extension HomeViewController: UICollectionViewDelegateFlowLayout{
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 195, height: 200)
      }
      
      func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          if let header = sportsCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as? CollectionViewHeader{
              header.headerImage.image = UIImage(named: "pic-1")
              return header
          }
          else{
              return UICollectionReusableView()
          }
      }
}

// MARK: UICollectionViewDataSource methods:
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomSportCell", for: indexPath) as! CustomSportCell
        
        cell.sportPicture.image = UIImage(named:  sportItems[indexPath.row].assetName)
        cell.sportLabel.text =   sportItems[indexPath.row].sportName
        
        return cell
    }
}

