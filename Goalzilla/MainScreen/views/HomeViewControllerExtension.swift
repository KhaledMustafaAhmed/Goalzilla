//
//  VCExtension.swift
//  TestCollection
//
//  Created by Khaled Mustafa on 21/05/2025.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == containerCollectionView {
            let sportsLeagueController = self.storyboard?.instantiateViewController(identifier: "sportLeagues") as! SportLeaguesTableViewController
                    
                sportsLeagueController.sport = sportItems[indexPath.row].sportName
                    
                self.navigationController?.pushViewController(sportsLeagueController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var result: Int!
        
        if collectionView == headerCollectionView{
            
            result =  slidesData.count
        }else if collectionView == containerCollectionView {
            result =  sportItems.count
        }
        return result
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView{
            
            let cell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            
            cell.sliderImage.image = slidesData[indexPath.row]
            cell.pageController.currentPage = currentCellIndex
            return cell
        }else{
            
            let cell = containerCollectionView.dequeueReusableCell(withReuseIdentifier: "CardView", for: indexPath) as! CardView
            cell.cardImage.image = UIImage(named: sportItems[indexPath.row].assetName)
            cell.cardLbl.text = sportItems[indexPath.row].sportName
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var itemWidth: CGFloat!
        var itemHeight: CGFloat!
        
        if collectionView == headerCollectionView{
            
             itemWidth = collectionView.bounds.width
             itemHeight = collectionView.bounds.height
            
        }else if collectionView == containerCollectionView {
      
            let spacing: CGFloat = 8
            let totalSpacing = spacing * 3 // 2 items per row: spacing on left + middle + right

             itemWidth = (collectionView.bounds.width - totalSpacing) / 2
             itemHeight = (collectionView.bounds.height - totalSpacing) / 2
        }
        
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == containerCollectionView {
            return UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        }
        
        return UIEdgeInsets()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        var result: CGFloat!
        if collectionView == headerCollectionView{
            result =  0
        }else if collectionView == containerCollectionView {
            result =  0
        }
        return result
    }
    
        func xibRegister(){
        headerCollectionView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCell")
        
        containerCollectionView.register(UINib(nibName: "CardView", bundle: nil), forCellWithReuseIdentifier: "CardView")
    }

}
