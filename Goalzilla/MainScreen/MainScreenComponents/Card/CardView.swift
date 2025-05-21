//
//  CardView.swift
//  TestCollection
//
//  Created by Khaled Mustafa on 21/05/2025.
//

import UIKit
import IBAnimatable

class CardView: UICollectionViewCell {

    @IBOutlet weak var cardImage: AnimatableImageView!
    
    @IBOutlet weak var cont: AnimatableView!
    
    @IBOutlet weak var cardLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

}
