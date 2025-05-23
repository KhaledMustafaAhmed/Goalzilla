//
//  OnBoardingCollectionViewCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 14/5/25.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var onBoardingImg: UIImageView!
    @IBOutlet weak var onBoardingSubTitlelabel: UILabel!
    @IBOutlet weak var onBoardingCaptionLabel: UILabel!
    
    func setup(_ slide:OnBoardingSlide){
        onBoardingImg.image = slide.image
        onBoardingCaptionLabel.text = slide.title
        onBoardingSubTitlelabel.text = slide.description
        
    }
}
