//
//  TeamCollectionViewCell.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 18/05/2025.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    // MARK: Outlets:
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        teamImage.layer.cornerRadius = 50
    }
}
