//
//  CompostionalLayout.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 18/5/25.
//
import Foundation
import UIKit

enum CompositionalGroupAlignment{
    case vertical
    case horizontal
}

struct CompostionalLayout{
    
    static func createItem(width: NSCollectionLayoutDimension , height:NSCollectionLayoutDimension ,spacing:CGFloat) -> NSCollectionLayoutItem{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    
    static func creatGroup(alignment:CompositionalGroupAlignment , width:NSCollectionLayoutDimension , height:NSCollectionLayoutDimension,items:[NSCollectionLayoutItem]) -> NSCollectionLayoutGroup{
        switch(alignment){
            case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height) , subitems: items)
            case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        }
    }
    
    static func creatGroup(alignment:CompositionalGroupAlignment , width:NSCollectionLayoutDimension , height:NSCollectionLayoutDimension,item:NSCollectionLayoutItem,count:Int) -> NSCollectionLayoutGroup{
        
        switch(alignment){
            case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height) , repeatingSubitem: item , count: count)
            case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), repeatingSubitem: item , count: count)
        }
    }
}
